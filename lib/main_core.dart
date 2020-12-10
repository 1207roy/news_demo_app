import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/common/news_theme.dart';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/screen/app_tab_screen.dart';
import 'package:newsapp/service_locator.dart';
import 'package:newsapp/services/app_component_interface.dart';
import 'package:newsapp/services/setting_repository.dart';

class NewsApp extends StatefulWidget {
  final AppComponentBase components;

  NewsApp(this.components);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//          statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xfff4f4f4),
        systemNavigationBarIconBrightness: Brightness.dark
    ));
  }

  @override
  Widget build(BuildContext context) {
    return NewsTheme(
      child: MaterialApp(
        title: 'News Demo',
        theme: ThemeData.light(),
        home: Builder(builder: (context) {
          final settingRepository = locator<SettingRepository>();
          final theme = NewsTheme.of(context);
          settingRepository.getThemeMode().then((themeMode) {
            final isNightMode = themeMode == AppThemeMode.dark;
            if(theme.isNightMode != isNightMode) {
              NewsTheme.of(context).changeThemeMode(themeMode == AppThemeMode.dark ? ThemeMode.dark : ThemeMode.light);
            }
          });
          
          return AppTabScreen();
        }),
      ),
    );
  }
}
