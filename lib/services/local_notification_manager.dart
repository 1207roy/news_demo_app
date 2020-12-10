import 'package:newsapp/models/models.dart';

abstract class LocalNotificationManager {
  Future<void> cancelNotification(int id);

  Future<void> scheduleDailyReminderNotification(
    SchedulableTime scheduledTime,
    String content,
    String payload,
  );

  Future<void> scheduleReminderNotification(
    DateTime dateTime,
    String content,
    String payload,
  );

  Future<void> cancelDailyReminderNotification();

  Future<void> showNotification(PushNotification pushNotification);
}
