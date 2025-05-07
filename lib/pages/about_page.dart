import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramod_portfolio/constants/footer_widget.dart';
import 'package:pramod_portfolio/constants/social_media_icon.dart';
import 'package:pramod_portfolio/constants/string_values.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StringValues.appBar,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Gap(30),
              Text('PRAMOD MORE', style: GoogleFonts.actor(fontSize: 30.0)),
              Text(
                'Photographer',
                style: GoogleFonts.actor(
                  fontSize: 20.0,
                  textStyle: TextStyle(wordSpacing: 5.0),
                ),
              ),
              Gap(20),
              CircleAvatar(
                foregroundImage: AssetImage('assets/images/profile_pic.png'),
                radius: 150,
              ),
              Gap(30),
              SizedBox(
                width: 810,
                child: Text(
                  ' Pramod is a Mumbai-based photographer with three years of experience, capturing life’s most cherished moments through creativity and passion. Specializing in portraits, events, and candid photography, he brings authenticity to every frame, ensuring emotions are preserved in stunning visuals. With a deep love for storytelling, Pramod continuously refines his craft, believing in the power of photography to celebrate life’s journeys. Whether it’s a grand celebration or a simple heartfelt moment, his dedication ensures that every image speaks volumes, creating timeless memories for those he photographs.',
                  style: GoogleFonts.hedvigLettersSans(
                    fontSize: 18.0,
                    textStyle: TextStyle(wordSpacing: 3.0),
                  ),
                ),
              ),
              Gap(30),
              Text(
                'Let\'s work together!',
                style: GoogleFonts.hedvigLettersSans(fontSize: 20.0),
              ),
              Text(
                'Contact me at: pramodcreativecaptures@gmail.com',
                style: GoogleFonts.hedvigLettersSans(fontSize: 20.0),
              ),
              Gap(30),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SocialMediaIcon(icon: StringValues.instagramIcon)],
              ),
              Gap(90),
              FooterWidget(),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
