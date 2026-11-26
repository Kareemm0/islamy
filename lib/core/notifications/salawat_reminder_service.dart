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

  bool _initialized = false;

  static const _intervalKey = 'salawat_interval_minutes';
  static const _channelId = 'salawat_voice_channel_v3';
  static const _channelName = 'تذكير الصلاة على النبي ﷺ';
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

  Future<void> requestPermissions() async {
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.requestNotificationsPermission();
    await androidPlugin?.requestExactAlarmsPermission();

    final iosPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    await iosPlugin?.requestPermissions(alert: true, badge: false, sound: true);
  }

  NotificationDetails _notificationDetails() {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: 'تنبيه صوتي للصلاة على النبي ﷺ',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('salawat'),
      audioAttributesUsage: AudioAttributesUsage.alarm,
      enableVibration: true,
      silent: false,
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

  /// Sets the reminder interval in minutes (5..30) and schedules background
  /// sound notifications that fire even when the app is closed.
  Future<void> setIntervalMinutes(int minutes) async {
    await init();
    await requestPermissions();
    await _box.put(_intervalKey, minutes.toString());
    await _scheduleAll(minutes);
  }

  /// Disables the reminder and cancels all pending notifications.
  Future<void> disable() async {
    await init();
    await _box.delete(_intervalKey);
    await _cancelPendingBatch();
  }

  /// Plays an immediate test notification with the "صلِّ على محمد" sound.
  Future<void> playTestNotification() async {
    await init();
    await requestPermissions();
    await _plugin.show(
      id: _periodicNotificationId - 1,
      title: '',
      body: '',
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
    await _cancelPendingBatch();

    final details = _notificationDetails();
    final duration = Duration(minutes: minutes);

    // Use native OS periodic scheduling with custom duration (supported on Android & iOS)
    try {
      await _plugin.periodicallyShowWithDuration(
        id: _periodicNotificationId,
        title: '',
        body: '',
        repeatDurationInterval: duration,
        notificationDetails: details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    } catch (_) {
      // Fallback: pre-schedule 60 OS-level exact alarm notifications
      final now = tz.TZDateTime.now(tz.local);
      for (var i = 1; i <= _scheduledCount; i++) {
        final scheduledTime = now.add(Duration(minutes: minutes * i));
        try {
          await _plugin.zonedSchedule(
            id: _baseNotificationId + (i - 1),
            title: '',
            body: '',
            scheduledDate: scheduledTime,
            notificationDetails: details,
            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          );
        } catch (_) {
          await _plugin.zonedSchedule(
            id: _baseNotificationId + (i - 1),
            title: '',
            body: '',
            scheduledDate: scheduledTime,
            notificationDetails: details,
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          );
        }
      }
    }
  }
}
