import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/social_media_icon.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font sizes and spacing based on screen width
    final double titleFontSize =
        screenWidth > 1024
            ? 30
            : screenWidth > 768
            ? 24
            : 20; // Adjust title font size
    final double textFontSize =
        screenWidth > 1024
            ? 14
            : screenWidth > 768
            ? 12
            : 10; // Adjust text font size
    final double iconSpacing =
        screenWidth > 1024
            ? 30
            : screenWidth > 768
            ? 20
            : 15; // Adjust spacing between icons
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

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Follow Me On Social Media !!!',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(10),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: iconSpacing,
            runSpacing: 10.0,
            children: [
              SocialMediaIcon(
                icon: WidgetValues.facebookIcon,
                onPressed: () async {
                  final url = Uri.parse(
                    "https://www.facebook.com/pramod96more",
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
              ),
              SocialMediaIcon(
                icon: WidgetValues.instagramIcon,
                onPressed: () async {
                  final url = Uri.parse(
                    "https://www.instagram.com/pramod_creative_capture",
                  );

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
              ),
              SocialMediaIcon(
                icon: WidgetValues.pinterestIcon,
                onPressed: () {},
              ),
              SocialMediaIcon(icon: WidgetValues.twitterIcon, onPressed: () {}),
            ],
          ),
          const Gap(20),
          Text(
            'Copyright © 2012-2023 • All rights reserved • Pramod Photography',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(20),
          Text(
            'All artwork is exclusively owned by Pramod Photography and is protected under copyright. \nThe content on this website may not be copied, stored, or used for personal or commercial purposes without explicit permission from Pramod Photography.',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: textFontSize, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
