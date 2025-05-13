import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/contact_me_widget.dart';
import 'package:pramod_portfolio/constants/footer_widget.dart';
import 'package:pramod_portfolio/constants/imageview_slider.dart';
import 'package:pramod_portfolio/constants/photography_cards.dart';
import 'package:pramod_portfolio/constants/tagline_card.dart';
import 'package:pramod_portfolio/responsive/responsive.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        hitTestBehavior: HitTestBehavior.translucent,
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            collapsedHeight: 150.0,
            floating: false,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground, StretchMode.fadeTitle],
              title: CachedNetworkImage(
                imageUrl: 'assets/images/Creative-Capture_logo.png',
              ),
              collapseMode: CollapseMode.parallax,
            ),
            backgroundColor: Colors.transparent,
            actions: [
              Expanded(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the actions
                  children:
                      MediaQuery.of(context).size.width > 1140
                          ? _buildDesktopActions(context) // Desktop layout
                          : _buildMobileActions(context), // Mobile layout
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Responsive(
              mobileLayout: _buildMobileLayout(),
              desktopLayout: _buildDesktopLayout(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  Widget _buildDesktopLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
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
    );
  }

  static List<Widget> _buildDesktopActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => Get.offAllNamed('/home'),
        child: Text('HOME', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
      ),
      const Gap(30),
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.black,
          style: GoogleFonts.hedvigLettersSans(
            fontSize: 17,
            color: Colors.white,
          ),
          items: const [
            DropdownMenuItem(value: 'Event', child: Text('Events Gallery')),
            DropdownMenuItem(
              value: 'Portrait',
              child: Text('Portraits Gallery'),
            ),
            DropdownMenuItem(value: 'PreWedding', child: Text('Pre Wedding')),
          ],
          onChanged: (value) {
            if (value != null) Get.toNamed('/$value'.toLowerCase());
          },
          hint: Text(
            'PHOTO GALLERY',
            style: GoogleFonts.hedvigLettersSans(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const Gap(30),
      TextButton(
        onPressed: () => Get.toNamed('/blog'),
        child: Text('BLOG', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
      ),
      const Gap(30),
      TextButton(
        onPressed: () => Get.toNamed('/bio'),
        child: Text('BIO', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
      ),
      const Gap(30),
      TextButton(
        onPressed: () => Get.toNamed('/contact'),
        child: Text(
          'CONTACT',
          style: GoogleFonts.hedvigLettersSans(fontSize: 17),
        ),
      ),
      const Gap(30),
    ];
  }

  static List<Widget> _buildMobileActions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert, size: 35, color: Colors.white),
        onSelected: (value) => Get.toNamed('/$value'.toLowerCase()),
        itemBuilder:
            (context) => [
              const PopupMenuItem(value: 'Home', child: Text('HOME')),
              const PopupMenuItem(value: 'Blog', child: Text('BLOG')),
              const PopupMenuItem(value: 'Bio', child: Text('BIO')),
              const PopupMenuItem(value: 'Contact', child: Text('CONTACT')),
            ],
      ),
    ];
  }
}
