import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/string_values.dart';

class TaglineCard extends StatelessWidget {
  const TaglineCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font sizes and padding based on screen width
    final double titleFontSize =
        screenWidth > 1024
            ? 33
            : screenWidth > 768
            ? 28
            : 22; // Adjust title font size for desktop, tablet, and mobile
    final double descriptionFontSize =
        screenWidth > 1024
            ? 23
            : screenWidth > 768
            ? 18
            : 16; // Adjust description font size
    final double horizontalPadding =
        screenWidth > 1024
            ? 50
            : screenWidth > 768
            ? 30
            : 20; // Adjust horizontal padding
    final double verticalPadding =
        screenWidth > 1024
            ? 70
            : screenWidth > 768
            ? 60
            : 40; // Adjust vertical padding

    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      elevation: 20.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.1,
            fit: BoxFit.cover,
            image: AssetImage(StringValues.bgImage),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          children: [
            SizedBox(
              child: Text(
                'Capturing life’s most precious moments with care, creativity, and a touch of warmth !!!',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(50),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'I am a passionate photographer with a keen eye for detail and a love for storytelling through images. \nMy goal is to create stunning visuals that evoke emotions and preserve memories for a lifetime.',
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
