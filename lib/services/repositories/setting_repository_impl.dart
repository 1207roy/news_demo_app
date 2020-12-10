import 'dart:async';
import 'dart:core';

import 'package:injectable/injectable.dart';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/resources/shared_preference_keys.dart';
import 'package:newsapp/services/instant_local_persistence_service.dart';
import 'package:newsapp/services/setting_repository.dart';

@LazySingleton(as: SettingRepository)
class SettingRepositoryImpl implements SettingRepository {
  final InstantLocalPersistenceService _instantLocalPersistenceService;

  SettingRepositoryImpl(
    this._instantLocalPersistenceService,
  );

  @override
  Future<void> setThemeMode(bool isNightMode) async {
    return _instantLocalPersistenceService.setBool(SHARED_PREFERENCE_KEY_IS_NIGHT_MODE, isNightMode);
  }

  @override
  Future<AppThemeMode> getThemeMode() async {
    try {
      final isNightMode = await _instantLocalPersistenceService.getBool(SHARED_PREFERENCE_KEY_IS_NIGHT_MODE, false);
      return isNightMode ? AppThemeMode.dark : AppThemeMode.light;
    } catch (e) {
      return AppThemeMode.light;
    }
  }

  @override
  Future<void> setShouldSyncInBackground(bool shouldSync) async {
    return _instantLocalPersistenceService.setBool(SHARED_PREFERENCE_KEY_SHOULD_SYNC_IN_BACKGROUND, shouldSync);
  }

  @override
  Future<bool> getShouldSyncInBackground() async {
    return await _instantLocalPersistenceService.getBool(SHARED_PREFERENCE_KEY_SHOULD_SYNC_IN_BACKGROUND, false);
  }

  @override
  Future<void> setIsReminderSet(bool isReminderSet) async {
    return _instantLocalPersistenceService.setBool(SHARED_PREFERENCE_KEY_IS_REMINDER_SET, isReminderSet);
  }

  @override
  Future<bool> getIsReminderSet() async {
    return await _instantLocalPersistenceService.getBool(SHARED_PREFERENCE_KEY_IS_REMINDER_SET, false);
  }

  @override
  Future<void> setReminderTime(String time) async {
    return _instantLocalPersistenceService.setString(SHARED_PREFERENCE_KEY_REMINDER_TIME, time);
  }

  @override
  Future<String> getReminderTime() async {
    return await _instantLocalPersistenceService.getString(SHARED_PREFERENCE_KEY_REMINDER_TIME, defaultValue: '12:00');
  }

  @override
  Future<void> clearData() async {
    var futures = <Future>[];
    futures
      ..add(_instantLocalPersistenceService.remove(SHARED_PREFERENCE_KEY_IS_NIGHT_MODE))
      ..add(_instantLocalPersistenceService.remove(SHARED_PREFERENCE_KEY_IS_REMINDER_SET))
      ..add(_instantLocalPersistenceService.remove(SHARED_PREFERENCE_KEY_REMINDER_TIME));
    return Future.wait(futures);
  }
}
