import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/string_values.dart';

class TaglineCard extends StatelessWidget {
  const TaglineCard({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 90),
        child: Column(
          children: [
            SizedBox(
              child: Text(
                'Capturing life’s most precious moments with care, creativity, and a touch of warmth !!!',
                style: TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            Gap(50),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'I am a passionate photographer with a keen eye for detail and a love for storytelling through images. \nMy goal is to create stunning visuals that evoke emotions and preserve memories for a lifetime.',
                    style: TextStyle(fontSize: 23),
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
