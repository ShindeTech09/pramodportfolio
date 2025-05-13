import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/footer_widget.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: screenWidth > 1024 ? true : false,

      appBar: WidgetValues.appBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Gap(200), FooterWidget(), Gap(50)],
        ),
      ),
    );
  }
}
