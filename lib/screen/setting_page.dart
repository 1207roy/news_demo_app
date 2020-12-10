import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:newsapp/common/news_theme.dart';
import 'package:newsapp/stores/setting_store.dart';
import 'package:newsapp/utils/extensions/extension.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutomaticKeepAliveClientMixin {
  SettingStore _store;
  NewsThemeState _theme;

  @override
  void initState() {
    super.initState();
    _store = context.read<SettingStore>();
  }

  @override
  Widget build(BuildContext context) {
    _theme = NewsTheme.of(context);
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          customSwitchTile(
            title: 'Dark Theme',
            subTitle: _store.hasDarkTheme ? 'Dark Mode' : 'Light Mode',
            value: _store.hasDarkTheme,
            onChanged: (isNightTheme) {
              _theme.changeThemeMode(isNightTheme ? ThemeMode.dark : ThemeMode.light);
              _store.updateTheme(isNightTheme);
            },
          ),
          SizedBox(height: context.responsiveHeight(15)),
          customSwitchTile(
            title: 'Update news in the background',
            subTitle:
                _store.shouldSyncInBackground ? 'News will update in every 60 seconds' : 'News won\'t update automatically',
            value: _store.shouldSyncInBackground,
            onChanged: (value) => _store.updateShouldSyncInBackground(value),
          ),
          SizedBox(height: context.responsiveHeight(15)),
          customSwitchTile(
            title: 'Enable Reminder Notification',
            subTitle:
            _store.isReminderSet ? 'You will get reminder notification' : 'You won\'t receive any reminder notification',
            value: _store.isReminderSet,
            onChanged: (value) => _store.updateIsReminderSet(value),
          ),
          if(_store.isReminderSet) SizedBox(height: context.responsiveHeight(15)),
          if(_store.isReminderSet) ListTile(
            title: Text('Set Daily Reminder time', style: TextStyle(color: _theme.settingTileTitleColor)),
            subtitle: Text(_store.reminderTime.getTimeInString(), style: TextStyle(color: _theme.settingTileSubtitleColor)),
            onTap: () {
              _showTimeSelector.then((timeOfDay) => _store.updateReminderTime(timeOfDay));
            },
          )
        ],
      ),
    );
  }

  Future<TimeOfDay> get _showTimeSelector => showTimePicker(
      context: context,
      initialTime: _store.reminderTime,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      });

  Widget customSwitchTile({String title, String subTitle, bool value, Function(bool value) onChanged}) {
    return SwitchListTile(
      title: Text(title ?? '', style: TextStyle(color: _theme.settingTileTitleColor)),
      subtitle: Text(subTitle ?? '', style: TextStyle(color: _theme.settingTileSubtitleColor)),
      value: value ?? false,
      onChanged: (bool value) => onChanged(value),
      activeColor: _theme.activeColor,
      activeTrackColor: _theme.activeTrackColor,
      inactiveThumbColor: _theme.inactiveThumbColor,
      inactiveTrackColor: _theme.inactiveTrackColor,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
