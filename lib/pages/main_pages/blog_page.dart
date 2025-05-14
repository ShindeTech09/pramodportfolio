import 'package:flutter/material.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: screenWidth > 1024 ? true : false,
      appBar: WidgetValues.appBar(context),
    );
  }
}
