import 'package:flutter/material.dart';
import 'package:newsapp/common/news_theme.dart';
import 'package:newsapp/utils/extensions/extension.dart';
import 'package:newsapp/widgets/shimmer_widget.dart';

class ShimmerGroupTile extends StatelessWidget {
  NewsThemeState _theme;

  @override
  Widget build(BuildContext context) {
    _theme = NewsTheme.of(context);

    return Container(
      margin: EdgeInsets.only(top: context.responsiveHeight(20), left: context.responsiveWidth(20), right: context.responsiveWidth(20)),
//      color: Colors.transparent,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget(height: context.responsiveHeight(10), width: context.responsiveWidth(80)),
                    SizedBox(height: context.responsiveHeight(8)),
                    ShimmerWidget(height: context.responsiveHeight(20)),
                    SizedBox(height: context.responsiveHeight(8)),
                    ShimmerWidget(height: context.responsiveHeight(20)),
                  ],
                ),
              ),
//              _buildNewsThumbnail(context)
            ],
          ),
          SizedBox(height: context.responsiveHeight(8)),
          ShimmerWidget(height: context.responsiveHeight(10), width: context.responsiveWidth(120)),
          SizedBox(height: context.responsiveHeight(20))
        ],
      ),
    );
  }

  Widget _buildNewsThumbnail(BuildContext context) {
    return Container(
      width: context.responsiveWidth(80),
      height: context.responsiveHeight(87),
      margin: EdgeInsets.only(left: context.responsiveWidth(13)),
      decoration: BoxDecoration(
          color: _theme.shimmerHighlightColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}