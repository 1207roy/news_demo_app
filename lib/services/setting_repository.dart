import 'package:newsapp/models/models.dart';

abstract class SettingRepository {
  Future<void> setThemeMode(bool isNightMode);

  Future<AppThemeMode> getThemeMode();

  Future<void> setShouldSyncInBackground(bool shouldSync);

  Future<bool> getShouldSyncInBackground();

  Future<void> setIsReminderSet(bool isReminderSet);

  Future<bool> getIsReminderSet();

  Future<void> setReminderTime(String time);

  Future<String> getReminderTime();
}
