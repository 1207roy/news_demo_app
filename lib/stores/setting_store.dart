import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:newsapp/common/mobx_provider.dart';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/service_locator.dart';
import 'package:newsapp/services/services.dart';
import 'package:newsapp/services/setting_repository.dart';
import 'package:newsapp/utils/extensions/extension.dart';
import 'package:newsapp/models/notification.dart' as n1;

part 'setting_store.g.dart';

class SettingStore = _SettingStoreBase with _$SettingStore;

abstract class _SettingStoreBase with Store, Disposable {
  _SettingStoreBase({final SettingRepository settingRepository, final LocalNotificationManager localNotificationManager})
      : _settingRepository = settingRepository ?? locator<SettingRepository>(),
      _localNotificationManager = localNotificationManager ?? locator<LocalNotificationManager>() {
    _initializeThemeStatus();
    _initializeShouldSyncStatus();
    _initializeReminderStatus();
  }

  final SettingRepository _settingRepository;
  final LocalNotificationManager _localNotificationManager;

  @observable
  bool _hasDarkTheme = false;

  bool get hasDarkTheme => _hasDarkTheme;

  @observable
  bool _shouldSyncInBackground = false;

  bool get shouldSyncInBackground => _shouldSyncInBackground;

  @observable
  bool _isReminderSet = false;

  bool get isReminderSet => _isReminderSet;

  @observable
  TimeOfDay _reminderTime = TimeOfDay(hour: 12, minute: 0);

  TimeOfDay get reminderTime => _reminderTime;

  void _initializeThemeStatus() {
    _settingRepository.getThemeMode().then((themeMode) {
      _hasDarkTheme = (themeMode == AppThemeMode.dark);
    });
  }

  void _initializeShouldSyncStatus() {
    _settingRepository.getShouldSyncInBackground().then((shouldSync) {
      _shouldSyncInBackground = shouldSync;
    });
  }

  void _initializeReminderStatus() {
    _settingRepository.getIsReminderSet().then((isReminderSet) {
      _isReminderSet = isReminderSet;
    });
    _settingRepository.getReminderTime().then((reminderTime) {
      try {
        _reminderTime =
            TimeOfDay(hour: int.parse(reminderTime.split(":")[0]), minute: int.parse(reminderTime.split(":")[1]));
      } on Exception catch (_) {
        _reminderTime = TimeOfDay(hour: 12, minute: 0);
      }
    });
  }

  @action
  void updateTheme(bool isNightMode) {
    _hasDarkTheme = isNightMode;
    _settingRepository.setThemeMode(isNightMode);
  }

  @action
  void updateShouldSyncInBackground(bool value) {
    _shouldSyncInBackground = value;
    _settingRepository.setShouldSyncInBackground(value);
  }

  @action
  void updateIsReminderSet(bool isReminderSet) {
    _isReminderSet = isReminderSet;
    _settingRepository.setIsReminderSet(isReminderSet);
    if(isReminderSet) {
      _scheduleDailyReminderNotification();
    } else {
      _cancelDailyReminderNotification();
    }
  }

  @action
  void updateReminderTime(TimeOfDay timeOfDay) {
    try {
      final time = timeOfDay.getTimeInString();
      _reminderTime = timeOfDay;
      _settingRepository.setReminderTime(time);
      _scheduleDailyReminderNotification();
    } on Exception catch (e) {}
  }

  Future<void> _scheduleDailyReminderNotification() async {
    final scheduledTime = SchedulableTime(
      reminderTime.hour,
      reminderTime.minute,
    );
    await _cancelDailyReminderNotification();
    await _localNotificationManager.scheduleDailyReminderNotification(scheduledTime, 'Hey check the updated News...', null);
  }

  Future<void> _cancelDailyReminderNotification() async {
    return await _localNotificationManager.cancelDailyReminderNotification();
  }
}
