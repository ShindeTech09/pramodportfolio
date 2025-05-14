import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/contact_me_widget.dart';
import 'package:pramod_portfolio/constants/footer_widget.dart';
import 'package:pramod_portfolio/constants/imageview_slider.dart';
import 'package:pramod_portfolio/constants/photography_cards.dart';
import 'package:pramod_portfolio/constants/tagline_card.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';
import 'package:pramod_portfolio/responsive/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: screenWidth > 1024 ? true : false,
      appBar: WidgetValues.appBar(context),
      body: Responsive(
        mobileLayout: _buildMobileLayout(),
        desktopLayout: _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ImageViewSlider(),
            Gap(20),
            TaglineCard(),
            Gap(20),
            PhotographyCards(),
            ContactMeWidget(),
            Gap(30),
            FooterWidget(),
            Gap(30),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ImageViewSlider(),
            Gap(30),
            TaglineCard(),
            // Gap(30),
            PhotographyCards(),
            ContactMeWidget(),
            Gap(50),
            FooterWidget(),
            Gap(50),
          ],
        ),
      ),
    );
  }
}
