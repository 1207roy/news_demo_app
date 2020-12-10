import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:newsapp/common/home_page_refresh_header.dart';
import 'package:newsapp/common/news_theme.dart';
import 'package:newsapp/stores/news_store.dart';
import 'package:newsapp/utils/extensions/extension.dart';
import 'package:newsapp/widgets/news_list_tile.dart';
import 'package:newsapp/widgets/shimmer_group_tile.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin {
  NewsThemeState _theme;
  NewsStore _store;
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _store = context.read<NewsStore>();
  }

  @override
  Widget build(BuildContext context) {
    _theme = NewsTheme.of(context);
    return Observer(
      builder: (_) => SafeArea(
        child: Column(
          children: [
            _buildSyncTime(),
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                header: _buildRefreshHeader(),
                child: _buildListView(),
                enablePullDown: true,
                onRefresh: _onRefresh,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSyncTime() {
    return _store.newsResult.maybeWhen((isUpdated) {
      return Container(
        height: context.responsiveHeight(30),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: context.responsiveWidth(20), vertical: context.responsiveHeight(5)),
        decoration: BoxDecoration(
            color: _theme.lastSyncTimeBlockColor,
            border: Border.all(color: _theme.borderColor, width: 1),
            borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: 'Last Synced At: ', style: _theme.lastSyncTitleTextStyle),
            TextSpan(text: _store.syncDate.showDateTime(), style: _theme.lastSyncDateTextStyle)
          ]),
        ),
      );
    }, orElse: () => Container());
  }

  Widget _buildListView() {
    return _store.newsResult.maybeWhen((isUpdated) {
      return ListView.builder(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: context.responsiveWidth(16), vertical: context.responsiveHeight(20)),
        itemCount: _store?.newsResponse?.articles?.length,
        itemBuilder: (context, index) {
          final articlesList = _store?.newsResponse?.articles ?? [];
          return NewsListTile(
            article: articlesList[index],
            index: index,
            onClick: (url) => _launchURL(url),
          );
        },
      );
    }, loading: () => _buildShimmer(), orElse: () => Container());
  }

  Widget _buildShimmer() {
    print('buildShimmer().........');
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 2,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ShimmerGroupTile(),
    );
  }

  Widget _buildRefreshHeader() {
    return HomePageRefreshHeader(
      height: 60,
      radius: 12,
      scrollController: _scrollController,
      refreshStyle: RefreshStyle.Follow,
    );
  }

  void _onRefresh() {
    _store.refresh();
    _refreshController.refreshCompleted();
  }

  _launchURL(String url) async {
    print('launching URLLLLLLLLLLLLLL');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  bool get wantKeepAlive => true;
}
