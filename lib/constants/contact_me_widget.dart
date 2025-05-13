import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pramod_portfolio/constants/string_values.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font sizes and padding based on screen width
    final double titleFontSize =
        screenWidth > 1024
            ? 30
            : screenWidth > 768
            ? 24
            : 20; // Adjust title font size
    final double iconSize =
        screenWidth > 1024
            ? 40
            : screenWidth > 768
            ? 30
            : 25; // Adjust icon size
    final double textFontSize =
        screenWidth > 1024
            ? 25
            : screenWidth > 768
            ? 20
            : 16; // Adjust text font size
    final double horizontalPadding =
        screenWidth > 1024
            ? 50
            : screenWidth > 768
            ? 30
            : 20; // Adjust horizontal padding
    final double verticalPadding =
        screenWidth > 1024
            ? 40
            : screenWidth > 768
            ? 30
            : 20; // Adjust vertical padding

    return SizedBox(
      width: screenWidth > 1024 ? 1000 : screenWidth * 0.9, // Adjust width
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Flex(
            direction:
                screenWidth > 850
                    ? Axis.horizontal
                    : Axis.vertical, // Switch layout
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You can Reach Me at?',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(EvaIcons.phone_call_outline, size: iconSize),
                      const Gap(15),
                      Text(
                        StringValues.phoneNumber,
                        style: TextStyle(fontSize: textFontSize),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(EvaIcons.email_outline, size: iconSize),
                      const Gap(15),
                      Text(
                        StringValues.emailID,
                        style: TextStyle(fontSize: textFontSize),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
