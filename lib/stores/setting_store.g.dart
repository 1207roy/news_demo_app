// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingStore on _SettingStoreBase, Store {
  final _$_hasDarkThemeAtom = Atom(name: '_SettingStoreBase._hasDarkTheme');

  @override
  bool get _hasDarkTheme {
    _$_hasDarkThemeAtom.reportRead();
    return super._hasDarkTheme;
  }

  @override
  set _hasDarkTheme(bool value) {
    _$_hasDarkThemeAtom.reportWrite(value, super._hasDarkTheme, () {
      super._hasDarkTheme = value;
    });
  }

  final _$_shouldSyncInBackgroundAtom =
      Atom(name: '_SettingStoreBase._shouldSyncInBackground');

  @override
  bool get _shouldSyncInBackground {
    _$_shouldSyncInBackgroundAtom.reportRead();
    return super._shouldSyncInBackground;
  }

  @override
  set _shouldSyncInBackground(bool value) {
    _$_shouldSyncInBackgroundAtom
        .reportWrite(value, super._shouldSyncInBackground, () {
      super._shouldSyncInBackground = value;
    });
  }

  final _$_isReminderSetAtom = Atom(name: '_SettingStoreBase._isReminderSet');

  @override
  bool get _isReminderSet {
    _$_isReminderSetAtom.reportRead();
    return super._isReminderSet;
  }

  @override
  set _isReminderSet(bool value) {
    _$_isReminderSetAtom.reportWrite(value, super._isReminderSet, () {
      super._isReminderSet = value;
    });
  }

  final _$_reminderTimeAtom = Atom(name: '_SettingStoreBase._reminderTime');

  @override
  TimeOfDay get _reminderTime {
    _$_reminderTimeAtom.reportRead();
    return super._reminderTime;
  }

  @override
  set _reminderTime(TimeOfDay value) {
    _$_reminderTimeAtom.reportWrite(value, super._reminderTime, () {
      super._reminderTime = value;
    });
  }

  final _$_SettingStoreBaseActionController =
      ActionController(name: '_SettingStoreBase');

  @override
  void updateTheme(bool isNightMode) {
    final _$actionInfo = _$_SettingStoreBaseActionController.startAction(
        name: '_SettingStoreBase.updateTheme');
    try {
      return super.updateTheme(isNightMode);
    } finally {
      _$_SettingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateShouldSyncInBackground(bool value) {
    final _$actionInfo = _$_SettingStoreBaseActionController.startAction(
        name: '_SettingStoreBase.updateShouldSyncInBackground');
    try {
      return super.updateShouldSyncInBackground(value);
    } finally {
      _$_SettingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateIsReminderSet(bool isReminderSet) {
    final _$actionInfo = _$_SettingStoreBaseActionController.startAction(
        name: '_SettingStoreBase.updateIsReminderSet');
    try {
      return super.updateIsReminderSet(isReminderSet);
    } finally {
      _$_SettingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateReminderTime(TimeOfDay timeOfDay) {
    final _$actionInfo = _$_SettingStoreBaseActionController.startAction(
        name: '_SettingStoreBase.updateReminderTime');
    try {
      return super.updateReminderTime(timeOfDay);
    } finally {
      _$_SettingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
