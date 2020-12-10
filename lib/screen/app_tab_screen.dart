import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:newsapp/common/mobx_provider.dart';
import 'package:newsapp/common/news_theme.dart';
import 'package:newsapp/common/themed_activity_indicator.dart';
import 'package:newsapp/screen/news_page.dart';
import 'package:newsapp/screen/setting_page.dart';
import 'package:newsapp/stores/news_store.dart';
import 'package:newsapp/stores/setting_store.dart';
import 'package:newsapp/utils/extensions/extension.dart';

class AppTabScreen extends StatefulWidget {
  @override
  _AppTabScreenState createState() => _AppTabScreenState();
}

class _AppTabScreenState extends State<AppTabScreen> {
  NewsThemeState _theme;
  ValueNotifier<int> _pageIndex;
  static const int NEWS_PAGE_INDEX = 0;
  static const SETTING_PAGE_INDEX = 1;
  NewsStore _newsStore;
  SettingStore _settingStore;

  ReactionDisposer _onNewsResultDisposer;
  ReactionDisposer _onNewsUpdateInBackgroundDisposer;

  @override
  void initState() {
    super.initState();
    _newsStore = NewsStore();
    _settingStore = SettingStore();

    _onNewsResultDisposer = reaction((_) => _newsStore.newsResult, (_) {
      _newsStore.newsResult.maybeWhen((_) {}, error: (error, message) {
        print('error: $error msg: $message');
        //show toast or something to inform the error
      }, orElse: () {});
    });

    _onNewsUpdateInBackgroundDisposer = reaction((_) => _settingStore.shouldSyncInBackground, (_) {
      if(_settingStore.shouldSyncInBackground) {
        _newsStore.updateTimer();
      } else {
        _newsStore.cancelTimer();
      }
    });

    _pageIndex = ValueNotifier<int>(NEWS_PAGE_INDEX);
  }

  @override
  void dispose() {
    _newsStore?.dispose();
    _settingStore?.dispose();
    _onNewsResultDisposer();
    _onNewsUpdateInBackgroundDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _theme = NewsTheme.of(context);
    return ValueListenableBuilder<int>(
      valueListenable: _pageIndex,
      builder: (context, pageIndex, ___) {
        return Scaffold(
          backgroundColor: _theme.backgroundColor,
          appBar: _appBar,
          bottomNavigationBar: _bottomNavigationBar,
          body: _widgetOptions[pageIndex],
        );
      },
    );
  }

  List<Widget> get _widgetOptions => <Widget>[
        MobxProvider.value(value: _newsStore, child: NewsPage()),
        MobxProvider.value(value: _settingStore, child: SettingsPage()),
      ];

  String get _title {
    switch (_pageIndex.value) {
      case NEWS_PAGE_INDEX:
        return 'News';
      case SETTING_PAGE_INDEX:
        return 'Setting';
      default:
        return '';
    }
  }

  _onTabChange(int pageIndex) => _pageIndex.value = pageIndex;

  AppBar get _appBar => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(_title, style: _theme.newsTitleTextStyle.copyWith(fontSize: context.responsiveHorizontalPixel(15))),
        actions: appBarActions,
      );

  List<Widget> get appBarActions => _pageIndex.value == NEWS_PAGE_INDEX
      ? <Widget>[
          Observer(
            builder: (context) => _newsStore.newsResult.maybeWhen((isUpdated) => _buildRefreshButton(),
                loading: () => _buildIndicators(), orElse: () => _buildRefreshButton()),
          )
        ]
      : null;

  Widget _buildRefreshButton() => FlatButton(
        onPressed: () => _newsStore.refresh(),
        child: Icon(Icons.refresh, color: _theme.newsTimeColor, size: context.responsiveWidth(20)),
      );

  Widget _buildIndicators() => FlatButton(
      onPressed: () {},
      child: ThemedActivityIndicator(
        radius: context.responsiveWidth(10),
        isDarkMode: _theme.isNightMode,
      ));

  BottomNavigationBar get _bottomNavigationBar => BottomNavigationBar(
        backgroundColor: _theme.footerColor,
        currentIndex: _pageIndex.value,
        selectedItemColor: _theme.selectedTabColor,
        onTap: (value) => _onTabChange(value),
        unselectedItemColor: _theme.newsTimeColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      );
}
