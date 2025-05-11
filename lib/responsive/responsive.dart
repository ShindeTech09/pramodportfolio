import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobileLayout,
    required this.desktopLayout,
  });

  final Widget mobileLayout;
  final Widget desktopLayout;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 1140
        ? mobileLayout
        : desktopLayout;
  }
}
