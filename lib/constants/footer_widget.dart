import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/social_media_icon.dart';
import 'package:pramod_portfolio/constants/string_values.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      spacing: 50.0,
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 900,
          child: Column(
            children: [
              Text(
                'Follow Me On Social Media !!!',
                style: TextStyle(fontSize: 30),
              ),
              Gap(10),
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  SocialMediaIcon(icon: StringValues.facebookIcon),
                  Gap(30),
                  SocialMediaIcon(icon: StringValues.instagramIcon),
                  Gap(30),
                  SocialMediaIcon(icon: StringValues.pinterestIcon),
                  Gap(30),
                  SocialMediaIcon(icon: StringValues.twitterIcon),
                ],
              ),
              Gap(20),
              Text(
                'Copyright © 2012-2023 • All rights reserved • Pramod Photography',
              ),
              Gap(30),
              Text(
                'All artwork is exclusively owned by Pramod Photography and is protected under copyright. \nThe content on this website may not be copied, stored, or used for personal or commercial purposes without explicit permission from Pramod Photography.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
