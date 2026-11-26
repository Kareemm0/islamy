import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_ce/hive.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Schedules recurring "صلِّ على محمد" sound notifications every N minutes
/// (5, 10, 15, 20, 25, or 30), working both in-app and when the app is closed.
class SalawatReminderService {
  SalawatReminderService(this._box);

  final Box<String> _box;
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Timer? _foregroundTimer;
  bool _initialized = false;

  static const _intervalKey = 'salawat_interval_minutes';
  static const _channelId = 'salawat_voice_channel_v5';
  static const _channelName = 'تذكير الصلاة على النبي ﷺ';
  static const _testNotificationId = 6998;
  static const _periodicNotificationId = 6999;
  static const _baseNotificationId = 7000;
  static const _scheduledCount = 60;

  static const List<int> supportedIntervals = [5, 10, 15, 20, 25, 30];

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
    tz_data.initializeTimeZones();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: false,
      requestSoundPermission: true,
    );
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: androidInit,
        iOS: iosInit,
      ),
    );

    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: 'تنبيه صوتي للصلاة على النبي ﷺ',
        importance: Importance.max,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('salawat'),
        audioAttributesUsage: AudioAttributesUsage.alarm,
      ),
    );

    _initialized = true;

    final saved = selectedMinutes;
    if (saved != null) {
      await _scheduleAll(saved);
    }
  }

  /// Requests permissions sequentially so the plugin does not throw
  /// `permissionRequestInProgress` when both notification and exact alarm
  /// permissions are needed.
  Future<void> requestPermissions() async {
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (androidPlugin != null) {
      try {
        final notifEnabled =
            await androidPlugin.areNotificationsEnabled() ?? false;
        if (!notifEnabled) {
          await androidPlugin.requestNotificationsPermission();
        }
      } catch (_) {}

      try {
        final canExact =
            await androidPlugin.canScheduleExactNotifications() ?? false;
        if (!canExact) {
          await androidPlugin.requestExactAlarmsPermission();
        }
      } catch (_) {}
    }

    final iosPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    try {
      await iosPlugin?.requestPermissions(
        alert: true,
        badge: false,
        sound: true,
      );
    } catch (_) {}
  }

  NotificationDetails _notificationDetails() {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: 'تنبيه صوتي للصلاة على النبي ﷺ',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('salawat'),
      audioAttributesUsage: AudioAttributesUsage.alarm,
      category: AndroidNotificationCategory.alarm,
      visibility: NotificationVisibility.public,
      enableVibration: true,
      onlyAlertOnce: false,
      autoCancel: true,
      // Auto-dismiss visual banner after 5 seconds so only the voice sound is noticed.
      timeoutAfter: 5000,
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: false,
      presentBanner: false,
      presentList: false,
      presentSound: true,
      sound: 'salawat.mp3',
    );
    return const NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
  }

  /// Sets the reminder interval in minutes (5..30) and schedules recurring
  /// notifications that play the "صلِّ على محمد" voice even when the app is closed.
  Future<void> setIntervalMinutes(int minutes) async {
    await init();
    await requestPermissions();
    await _box.put(_intervalKey, minutes.toString());
    await _scheduleAll(minutes);
  }

  /// Disables the reminder and cancels all pending notifications.
  Future<void> disable() async {
    await init();
    _foregroundTimer?.cancel();
    _foregroundTimer = null;
    await _box.delete(_intervalKey);
    await _cancelPendingBatch();
  }

  /// Plays an immediate notification with the "صلِّ على محمد" sound.
  Future<void> playTestNotification() async {
    await init();
    await requestPermissions();
    await _plugin.show(
      id: _testNotificationId,
      title: '\u200B',
      body: '\u200B',
      notificationDetails: _notificationDetails(),
    );
  }

  Future<void> _cancelPendingBatch() async {
    await _plugin.cancel(id: _periodicNotificationId);
    for (var i = 0; i < _scheduledCount; i++) {
      await _plugin.cancel(id: _baseNotificationId + i);
    }
  }

  Future<void> _scheduleAll(int minutes) async {
    _foregroundTimer?.cancel();
    await _cancelPendingBatch();

    final details = _notificationDetails();
    final now = tz.TZDateTime.now(tz.local);

    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    final canExact =
        await androidPlugin?.canScheduleExactNotifications() ?? false;
    final scheduleMode = canExact
        ? AndroidScheduleMode.alarmClock
        : AndroidScheduleMode.inexactAllowWhileIdle;

    // 1. Schedule 60 distinct OS-level alarms (covering up to 5–30 hours offline)
    // using distinct notification IDs so Android never suppresses repeated alerts
    // and AlarmClock mode bypasses Doze mode when the app is closed.
    for (var i = 1; i <= _scheduledCount; i++) {
      final scheduledTime = now.add(Duration(minutes: minutes * i));
      try {
        await _plugin.zonedSchedule(
          id: _baseNotificationId + (i - 1),
          title: '\u200B',
          body: '\u200B',
          scheduledDate: scheduledTime,
          notificationDetails: details,
          androidScheduleMode: scheduleMode,
        );
      } catch (_) {
        try {
          await _plugin.zonedSchedule(
            id: _baseNotificationId + (i - 1),
            title: '\u200B',
            body: '\u200B',
            scheduledDate: scheduledTime,
            notificationDetails: details,
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          );
        } catch (_) {}
      }
    }

    // 2. Also refresh the queue automatically whenever the app is open.
    _foregroundTimer = Timer.periodic(
      Duration(minutes: minutes),
      (_) => _scheduleAll(minutes),
    );
  }
}
