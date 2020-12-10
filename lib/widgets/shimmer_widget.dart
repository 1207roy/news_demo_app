import 'package:flutter/material.dart';
import 'package:newsapp/common/news_theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final double borderRadius;

  ShimmerWidget({this.padding, this.margin, this.width = 150, this.height = 180, this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return ShimmerWraper(
      child: Container(
        padding: padding != null ? padding : null,
        margin: margin != null ? margin : null,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: NewsTheme.of(context).shimmerBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ShimmerWraper extends StatelessWidget {
  final Widget child;

  ShimmerWraper({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: NewsTheme.of(context).shimmerBaseColor,
      highlightColor: NewsTheme.of(context).shimmerHighlightColor,
      child: child,
    );
  }
}
