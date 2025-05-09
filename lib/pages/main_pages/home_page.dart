import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/contact_me_widget.dart';
import 'package:pramod_portfolio/constants/footer_widget.dart';
import 'package:pramod_portfolio/constants/imageview_slider.dart';
import 'package:pramod_portfolio/constants/photography_cards.dart';
import 'package:pramod_portfolio/constants/tagline_card.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetValues.appBar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageViewSlider(),
              Gap(30),
              TaglineCard(),
              Gap(30),
              PhotographyCards(),
              ContactMeWidget(),
              Gap(50),
              FooterWidget(),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
