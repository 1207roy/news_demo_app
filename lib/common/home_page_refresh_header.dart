import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/common/themed_activity_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:newsapp/utils/extensions/extension.dart';

class HomePageRefreshHeader extends StatefulWidget {
  final double height;
  final double radius;
  final ScrollController scrollController;
  final RefreshStyle refreshStyle;

  HomePageRefreshHeader(
      {@required this.height, @required this.radius, @required this.scrollController, @required this.refreshStyle});

  @override
  State<StatefulWidget> createState() {
    return _HomePageRefreshHeaderState();
  }
}

class _HomePageRefreshHeaderState extends State<HomePageRefreshHeader> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;
  bool _animating = false;
  double offset = 0;

  @override
  void initState() {
    setScrollOffset();
    widget.scrollController.addListener(onScroll);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _curvedAnimation = CurvedAnimation(curve: Curves.easeIn, parent: _animationController);
    _curvedAnimation.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void didUpdateWidget(HomePageRefreshHeader oldWidget) {
    oldWidget.scrollController.removeListener(onScroll);
    widget.scrollController.addListener(onScroll);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.scrollController.removeListener(onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius = widget.radius;
    if (offset < 0) {
      final absOffset = offset.abs();
      if (absOffset < widget.height) {
        radius = absOffset / widget.height * radius;
      }
    }
    final paddingTop = MediaQuery.of(context).padding.top;
    return CustomHeader(
      height: widget.height,
      refreshStyle: widget.refreshStyle,
      builder: (context, refreshStatus) {
        double currentRadius = radius;
        if (_animationController.isAnimating) {
          final animatedRadius = (1 - _curvedAnimation.value) * widget.radius;
          currentRadius = animatedRadius > 0 ? animatedRadius : 0.1;
        } else if (refreshStatus == RefreshStatus.refreshing) {
          currentRadius = widget.radius;
        } else if (refreshStatus == RefreshStatus.idle) {
          _animating = false;
        } else if (refreshStatus == RefreshStatus.completed) {
          if (!_animating) {
            _animating = true;
            Future.delayed(Duration.zero).then((_) {
              _animationController.reset();
              _animationController.forward();
            });
          } else {
            currentRadius = 0.1;
          }
        }
        return Padding(
          padding: EdgeInsets.only(
            top: paddingTop,
          ),
          child: ThemedActivityIndicator(
            radius: currentRadius,
          ),
        );
      },
    );
  }

  void onScroll() {
    setState(() {
      setScrollOffset();
    });
  }

  void setScrollOffset() {
    if (widget.scrollController.hasClients) {
      final controller = widget.scrollController;
      if (controller.hasPositions) {
        offset = widget.scrollController.offset;
      } else {
        offset = widget.scrollController.offset;
      }
    }
  }
}

class FooterRefreshIndicator extends StatelessWidget {
  final double height;
  final double radius;
  final LoadStyle loadStyle;

  FooterRefreshIndicator({
    @required this.height,
    @required this.radius,
    this.loadStyle = LoadStyle.ShowWhenLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      height: height,
      loadStyle: loadStyle,
      builder: (context, loadStatus) {
        if (loadStatus == LoadStatus.loading) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: ThemedActivityIndicator(
              radius: radius,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
