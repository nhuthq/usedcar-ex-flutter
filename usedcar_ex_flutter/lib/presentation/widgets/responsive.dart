import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? webLayout;
  final Widget? tabletLayout;
  final Widget? mobileLayout;
  final Widget child;

  const ResponsiveWidget({
    Key? key,
    required this.child,
    this.webLayout,
    this.tabletLayout,
    this.mobileLayout,
  }) : super(key: key);

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  static bool isWebScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 768) {
          return webLayout ?? child;
        } else {
          return mobileLayout ?? child;
        }
      },
    );
  }
}
