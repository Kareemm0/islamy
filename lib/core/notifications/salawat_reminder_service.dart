import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:hive_ce/hive.dart';

/// Plays the recurring "صلِّ على محمد" audio sound every N minutes
/// (5, 10, 15, 20, 25, or 30) directly using [AudioPlayer].
class SalawatReminderService {
  SalawatReminderService(this._box);

  final Box<String> _box;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Timer? _periodicTimer;
  bool _initialized = false;

  static const _intervalKey = 'salawat_interval_minutes';
  static const _assetPath = 'audio/salawat.mp3';

  static const List<int> supportedIntervals = [5, 10, 15, 20, 25, 30];

  static final AudioContext _loudAudioContext = AudioContext(
    android: const AudioContextAndroid(
      isSpeakerphoneOn: true,
      stayAwake: false,
      contentType: AndroidContentType.speech,
      usageType: AndroidUsageType.alarm,
      audioFocus: AndroidAudioFocus.gainTransientMayDuck,
    ),
    iOS: AudioContextIOS(
      category: AVAudioSessionCategory.playback,
      options: const {
        AVAudioSessionOptions.mixWithOthers,
        AVAudioSessionOptions.duckOthers,
      },
    ),
  );

  /// Currently saved interval in minutes, or `null` if disabled.
  int? get selectedMinutes {
    final raw = _box.get(_intervalKey);
    if (raw == null) return null;
    final parsed = int.tryParse(raw);
    return (parsed != null && parsed > 0) ? parsed : null;
  }

  bool get isEnabled => selectedMinutes != null;

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    await AudioPlayer.global.setAudioContext(_loudAudioContext);
    await _audioPlayer.setAudioContext(_loudAudioContext);
    await _audioPlayer.setReleaseMode(ReleaseMode.stop);
    await _audioPlayer.setVolume(1.0);

    final saved = selectedMinutes;
    if (saved != null) {
      _startPeriodicTimer(saved);
    }
  }

  /// Sets the reminder interval in minutes (5..30) and starts the periodic
  /// timer that plays the "صلِّ على محمد" sound every [minutes] minutes.
  Future<void> setIntervalMinutes(int minutes) async {
    await init();
    await _box.put(_intervalKey, minutes.toString());
    _startPeriodicTimer(minutes);
  }

  /// Disables the periodic sound reminder and stops any active timer/audio.
  Future<void> disable() async {
    await init();
    _periodicTimer?.cancel();
    _periodicTimer = null;
    await _box.delete(_intervalKey);
    await _audioPlayer.stop();
  }

  /// Plays the "صلِّ على محمد" sound immediately.
  Future<void> playTestNotification() async {
    await init();
    await playSound();
  }

  /// Plays `assets/audio/salawat.mp3` at maximum loudspeaker volume.
  Future<void> playSound() async {
    await _audioPlayer.stop();
    await _audioPlayer.setVolume(1.0);
    await _audioPlayer.play(
      AssetSource(_assetPath),
      volume: 1.0,
      ctx: _loudAudioContext,
    );
  }

  void _startPeriodicTimer(int minutes) {
    _periodicTimer?.cancel();
    _periodicTimer = Timer.periodic(
      Duration(minutes: minutes),
      (_) => playSound(),
    );
  }
}
