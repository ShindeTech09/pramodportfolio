import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramod_portfolio/constants/contact_me_widget.dart';
import 'package:pramod_portfolio/constants/footer_widget.dart';
import 'package:pramod_portfolio/constants/imageview_slider.dart';
import 'package:pramod_portfolio/constants/photography_cards.dart';
import 'package:pramod_portfolio/constants/tagline_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        backgroundColor: Colors.transparent,
        title: const Text('Pramod Portfolio'),
        titleTextStyle: GoogleFonts.lobster(
          textStyle: const TextStyle(
            letterSpacing: 2,
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'HOME',
              style: GoogleFonts.hedvigLettersSans(fontSize: 17),
            ),
          ),
          Gap(30),
          TextButton(
            onPressed: () {},
            child: Text(
              'PORTFOLIO',
              style: GoogleFonts.hedvigLettersSans(fontSize: 17),
            ),
          ),
          Gap(30),
          TextButton(
            onPressed: () {},
            child: Text(
              'CLIENT\'S GALLERY',
              style: GoogleFonts.hedvigLettersSans(fontSize: 17),
            ),
          ),
          Gap(30),
          TextButton(
            onPressed: () {},
            child: Text(
              'BLOG',
              style: GoogleFonts.hedvigLettersSans(fontSize: 17),
            ),
          ),
          Gap(30),
          TextButton(
            onPressed: () {},
            child: Text(
              'ABOUT',
              style: GoogleFonts.hedvigLettersSans(fontSize: 17),
            ),
          ),
          Gap(30),
          TextButton(
            onPressed: () {},
            child: Text(
              'CONTACT',
              style: GoogleFonts.hedvigLettersSans(fontSize: 17),
            ),
          ),
          Gap(30),
        ],
      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
