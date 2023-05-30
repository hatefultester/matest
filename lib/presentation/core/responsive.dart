import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return desktop;
    } else if (context.isTablet) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

extension ResponsiveExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= 500;

  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024 &&
      MediaQuery.of(this).size.width >= 600;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;
}
