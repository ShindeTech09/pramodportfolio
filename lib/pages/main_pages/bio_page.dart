import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramod_portfolio/constants/footer_widget.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class BioPage extends StatelessWidget {
  const BioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font sizes and layout based on screen width
    final double titleFontSize =
        screenWidth > 1024
            ? 40
            : screenWidth > 768
            ? 30
            : 24; // Adjust title font size
    final double subtitleFontSize =
        screenWidth > 1024
            ? 24
            : screenWidth > 768
            ? 20
            : 16; // Adjust subtitle font size
    final double descriptionFontSize =
        screenWidth > 1024
            ? 20
            : screenWidth > 768
            ? 18
            : 14; // Adjust description font size
    final double avatarRadius =
        screenWidth > 1024
            ? 150
            : screenWidth > 768
            ? 120
            : 100; // Adjust avatar size
    final double contentWidth =
        screenWidth > 1024
            ? 810
            : screenWidth > 768
            ? 600
            : screenWidth * 0.9; // Adjust content width

    return Scaffold(
      extendBodyBehindAppBar: screenWidth > 1024 ? true : false,

      appBar: WidgetValues.appBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(screenWidth > 800 ? 180 : 50),
              Text(
                'PRAMOD MORE',
                style: GoogleFonts.actor(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Photographer',
                style: GoogleFonts.actor(
                  fontSize: subtitleFontSize,
                  textStyle: const TextStyle(wordSpacing: 5.0),
                ),
              ),
              const Gap(20),
              CircleAvatar(
                foregroundImage: const AssetImage(
                  'assets/images/profile_pic.png',
                ),
                radius: avatarRadius,
              ),
              const Gap(30),
              SizedBox(
                width: contentWidth,
                child: Text(
                  'Pramod is a Mumbai-based photographer with three years of experience, capturing life’s most cherished moments through creativity and passion. Specializing in portraits, events, and candid photography, he brings authenticity to every frame, ensuring emotions are preserved in stunning visuals. With a deep love for storytelling, Pramod continuously refines his craft, believing in the power of photography to celebrate life’s journeys. Whether it’s a grand celebration or a simple heartfelt moment, his dedication ensures that every image speaks volumes, creating timeless memories for those he photographs.',
                  style: GoogleFonts.hedvigLettersSans(
                    fontSize: descriptionFontSize,
                    textStyle: const TextStyle(wordSpacing: 3.0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(30),
              Text(
                'Let\'s work together!',
                style: GoogleFonts.hedvigLettersSans(
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Contact me at: pramodcreativecaptures@gmail.com',
                style: GoogleFonts.hedvigLettersSans(
                  fontSize: subtitleFontSize,
                ),
              ),
              const Gap(90),
              const FooterWidget(),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
