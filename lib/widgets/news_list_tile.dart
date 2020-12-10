import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/common/news_theme.dart';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/utils/extensions/extension.dart';

class NewsListTile extends StatefulWidget {
  final Article article;
  final int index;
  final Function(String) onClick;

  const NewsListTile({Key key, this.article, this.index, this.onClick}) : super(key: key);

  @override
  _NewsListTileState createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  NewsThemeState _theme;

  @override
  Widget build(BuildContext context) {
    _theme = NewsTheme.of(context);
    return Container(
      margin: EdgeInsets.only(top: context.responsiveHeight(20)),
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildIndex(widget.index + 1),
          Expanded(
            child: InkWell(
              onTap: () => widget.onClick(widget.article.url),
              child: Container(
                decoration: BoxDecoration(
                  color: _theme.backgroundColor,
                  border: Border(bottom: BorderSide(color: _theme.borderColor))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildNewsSourceText(widget.article.source.name),
                              _buildNewsTitleText(widget.article.title)
                            ],
                          ),
                        ),
                        _buildNewsThumbnail(widget.article.urlToImage)
                      ],
                    ),
                    SizedBox(height: context.responsiveHeight(8)),
                    _buildNewsTimeText(visibleDateFormat(widget.article.publishedAt), author: widget.article.author),
                    SizedBox(height: context.responsiveHeight(20))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

//    return Card(
//      color: _theme.backgroundColor,
//      margin: EdgeInsets.only(top: context.responsiveHeight(20)),
//      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: [
//          _buildIndex(widget.index + 1),
//          Expanded(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Row(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Expanded(
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: [
//                          _buildNewsSourceText(widget.article.source.name),
//                          _buildNewsTitleText(widget.article.title)
//                        ],
//                      ),
//                    ),
//                    _buildNewsThumbnail(widget.article.urlToImage)
//                  ],
//                ),
//                SizedBox(height: context.responsiveHeight(8)),
//                _buildNewsTimeText(visibleDateFormat(widget.article.publishedAt), author: widget.article.author),
//                SizedBox(height: context.responsiveHeight(20))
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
  }

//  @override
//  Widget build(BuildContext context) {
//    _theme = NewsTheme.of(context);
//    return Card(
//      color: _theme.backgroundColor,
//      margin: EdgeInsets.only(top: context.responsiveHeight(20)),
//      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: [
//          _buildIndex(widget.index + 1),
//          Expanded(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Row(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Expanded(
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: [
//                          _buildNewsSourceText(widget.article.source.name),
//                          _buildNewsTitleText(widget.article.title)
//                        ],
//                      ),
//                    ),
//                    _buildNewsThumbnail(widget.article.urlToImage)
//                  ],
//                ),
//                SizedBox(height: context.responsiveHeight(8)),
//                _buildNewsTimeText(visibleDateFormat(widget.article.publishedAt), author: widget.article.author),
//                SizedBox(height: context.responsiveHeight(20))
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }

  String visibleDateFormat(DateTime dateTime) {
    return dateTime.isToday ? dateTime.showTimeAgo() : dateTime.showDateTime();
  }

  Widget _buildIndex(int index) {
    return Container(
      width: context.responsiveWidth(20),
      alignment: Alignment.topLeft,
      child: Text('$index.', style: _theme.newsSourceTextStyle.copyWith(color: _theme.newsIndexColor)),
    );
  }

  Widget _buildNewsThumbnail(String imageUrl) {
    final width = context.responsiveWidth(80);
    final height = context.responsiveHeight(87);
    return CachedNetworkImage(
      fadeInDuration: Duration(milliseconds: 200),
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(left: context.responsiveWidth(13)),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(5)),
      ),
      errorWidget: (_, __, ___) => Container(),
      placeholder: (_, __) => Container(
        color: _theme.imageLoadingColor,
        width: width,
        height: height,
      ),
    );
  }

//  Container(
//    color: _theme.imageLoadingColor,
//    width: width,
//    height: height,
//    alignment: Alignment.center,
//    child: Icon(Icons.photo, color: _theme.imagePlaceHolderIconColor, size: context.responsiveWidth(20)),
//  )

  Widget _buildNewsSourceText(String text) {
    return Text(text,
        style: _theme.newsSourceTextStyle.copyWith(
          fontSize: context.responsiveHorizontalPixel(12),
        ));
  }

  Widget _buildNewsTitleText(String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final constraintMaxWidth = constraints.maxWidth;
        double fontSize;
        if (constraintMaxWidth > context.responsiveWidth(290)) {
          fontSize = context.responsiveHorizontalPixel(16);
        } else {
          fontSize = context.responsiveHorizontalPixel(13);
        }
        return Text(text,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: _theme.newsTitleTextStyle.copyWith(
              fontSize: fontSize,
            ));
      },
    );
  }

  Widget _buildNewsTimeText(String text, {String author}) {
    return Row(
      children: [
        Text(text ?? '',
            style: _theme.newsTimeTextStyle.copyWith(
              fontSize: context.responsiveHorizontalPixel(12),
            )),
        if (author?.isNotEmpty ?? false)
          Expanded(
              child: Row(
            children: [
              Container(
                width: context.responsiveWidth(3),
                height: context.responsiveWidth(3),
                margin: EdgeInsets.symmetric(horizontal: context.responsiveWidth(8)),
                decoration: BoxDecoration(shape: BoxShape.circle, color: _theme.newsTimeColor),
              ),
              Expanded(
                child: Text(author ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: _theme.newsTimeTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: context.responsiveHorizontalPixel(12),
                    )),
              )
            ],
          )),
      ],
    );
  }
}
