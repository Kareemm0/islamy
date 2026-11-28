import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:hive_ce/hive.dart';
import 'package:islamy/features/home/data/datasources/prayer_times_cache_datasource.dart';
import 'package:islamy/features/home/domain/entities/home_prayer.dart';

/// Plays `assets/audio/azan.mp3` automatically when a prayer time arrives.
class AzanAudioService {
  AzanAudioService({
    required Box<String> settingsBox,
    required PrayerTimesCacheDatasource prayerCache,
  }) : _settingsBox = settingsBox,
       _prayerCache = prayerCache;

  final Box<String> _settingsBox;
  final PrayerTimesCacheDatasource _prayerCache;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Timer? _checkTimer;
  bool _initialized = false;
  List<HomePrayer> _prayers = const [];
  String? _lastTriggeredKey;

  static const _enabledKey = 'azan_audio_enabled';
  static const _assetPath = 'audio/azan.mp3';

  static final AudioContext _azanAudioContext = AudioContext(
    android: const AudioContextAndroid(
      isSpeakerphoneOn: true,
      stayAwake: true,
      contentType: AndroidContentType.music,
      usageType: AndroidUsageType.alarm,
      audioFocus: AndroidAudioFocus.gainTransient,
    ),
    iOS: AudioContextIOS(
      category: AVAudioSessionCategory.playback,
      options: const {
        AVAudioSessionOptions.mixWithOthers,
        AVAudioSessionOptions.duckOthers,
      },
    ),
  );

  /// Whether automatic Azan playback at prayer time is enabled (defaults to `true`).
  bool get isEnabled {
    final raw = _settingsBox.get(_enabledKey);
    if (raw == null) return true;
    return raw == 'true';
  }

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    await _audioPlayer.setAudioContext(_azanAudioContext);
    await _audioPlayer.setReleaseMode(ReleaseMode.stop);
    await _audioPlayer.setVolume(1.0);

    final cached = _prayerCache.getCached();
    if (cached != null && cached.prayers.isNotEmpty) {
      _prayers = cached.prayers;
    }

    _checkTimer?.cancel();
    _checkTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => checkPrayerTime(DateTime.now()),
    );
  }

  /// Updates the active list of today's prayers to monitor.
  void updatePrayers(List<HomePrayer> prayers) {
    if (prayers.isNotEmpty) {
      _prayers = List<HomePrayer>.unmodifiable(prayers);
    }
  }

  /// Enables or disables Azan sound at prayer times.
  /// If disabled while Azan is playing, stops playback immediately.
  Future<void> setEnabled(bool enabled) async {
    await _settingsBox.put(_enabledKey, enabled.toString());
    if (!enabled) {
      await stopAzan();
    }
  }

  /// Checks if [now] matches any prayer's `HH:mm` time and triggers the Azan
  /// once for that prayer on that day.
  void checkPrayerTime(DateTime now, [List<HomePrayer>? prayersOverride]) {
    if (!isEnabled) return;
    final list =
        (prayersOverride != null && prayersOverride.isNotEmpty)
            ? prayersOverride
            : _prayers;
    if (list.isEmpty) return;

    for (final prayer in list) {
      final hm = _parseHourMinute(prayer.time);
      if (hm == null) continue;
      final (hour, minute) = hm;
      if (now.hour == hour && now.minute == minute && now.second <= 2) {
        triggerForPrayer(prayer, now);
        break;
      }
    }
  }

  /// Triggers the Azan for [prayer] on [now]'s date if not already played.
  Future<void> triggerForPrayer(HomePrayer prayer, [DateTime? now]) async {
    if (!isEnabled) return;
    final time = now ?? DateTime.now();
    final key =
        '${time.year}-${time.month}-${time.day}-${prayer.name}-${prayer.time}';
    if (_lastTriggeredKey == key) return;
    _lastTriggeredKey = key;
    await playAzan();
  }

  /// Plays `assets/audio/azan.mp3` immediately at full volume.
  Future<void> playAzan() async {
    await init();
    await _audioPlayer.stop();
    await _audioPlayer.setVolume(1.0);
    await _audioPlayer.play(
      AssetSource(_assetPath),
      volume: 1.0,
      ctx: _azanAudioContext,
    );
  }

  /// Stops any currently playing Azan sound.
  Future<void> stopAzan() async {
    await _audioPlayer.stop();
  }

  (int, int)? _parseHourMinute(String rawTime) {
    final clean = rawTime.trim().split(' ').first;
    final parts = clean.split(':');
    if (parts.length < 2) return null;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null) return null;
    return (h, m);
  }
}
