import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pramod_portfolio/constants/event_cards.dart';
import 'package:pramod_portfolio/constants/image_viewer_widget.dart';
import 'package:pramod_portfolio/constants/social_media_icon.dart';
import 'package:pramod_portfolio/constants/string_values.dart';
import 'package:pramod_portfolio/loading_screen.dart';

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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoadingScreen()),
              );
            },
            child: Text('HOME'),
          ),
          Gap(30),
          TextButton(onPressed: () {}, child: Text('PORTFOLIO')),
          Gap(30),
          TextButton(onPressed: () {}, child: Text('CLIENT\'S GALLERY')),
          Gap(30),
          TextButton(onPressed: () {}, child: Text('BLOG')),
          Gap(30),
          TextButton(onPressed: () {}, child: Text('ABOUT')),
          Gap(30),
          TextButton(onPressed: () {}, child: Text('CONTACT')),
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
              CarouselSlider(
                items: [
                  ImageViewerWidget(imagePath: StringValues.image1),
                  ImageViewerWidget(imagePath: StringValues.image2),
                  ImageViewerWidget(imagePath: StringValues.image3),
                  ImageViewerWidget(imagePath: StringValues.image4),
                  ImageViewerWidget(imagePath: StringValues.image5),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.99,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
              ),
              Gap(30),
              Card(
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
              ),
              Gap(30),
              Container(
                height: 400,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: GridView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  children: [
                    EventCards(
                      imagePath: StringValues.cardSlider1,
                      textTitle: 'Event Photography',
                    ),
                    EventCards(
                      imagePath: StringValues.cardSlider2,
                      textTitle: 'Pre Wedding Photography',
                    ),
                    EventCards(
                      imagePath: StringValues.cardSlider6,
                      textTitle: 'Wedding Photography',
                    ),
                    EventCards(
                      imagePath: StringValues.cardSlider3,
                      textTitle: 'Corporate Photography',
                    ),
                    EventCards(
                      imagePath: StringValues.cardSlider4,
                      textTitle: 'Portrait Photography',
                    ),
                    EventCards(
                      imagePath: StringValues.cardSlider5,
                      textTitle: 'Food Photography',
                    ),
                    EventCards(
                      imagePath: StringValues.cardSlider3,
                      textTitle: 'Food Photography',
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 1000,
                child: Card(
                  elevation: 30.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          'Wanna A Reach Me?',
                          style: TextStyle(fontSize: 30),
                        ),
                        Gap(20),
                        Icon(HeroIcons.arrow_right, size: 30),
                        Gap(50),
                        Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(EvaIcons.phone_call_outline, size: 40),
                                Gap(15),
                                Text(
                                  '+911234567890',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Icon(EvaIcons.email_outline, size: 40),
                                Gap(15),
                                Text(
                                  'someone@gmail.com',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Icon(EvaIcons.map_outline, size: 40),
                                Gap(15),
                                Text(
                                  'Naigaon (East), Tal. Vasai, \nDist. Palghar, Maharashtra 401208',
                                  style: TextStyle(fontSize: 15),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gap(50),
              Flex(
                spacing: 50.0,
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 550,
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

                  SizedBox(
                    // width: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contact Me', style: TextStyle(fontSize: 30)),
                        Gap(10),
                        Row(
                          children: [
                            Icon(EvaIcons.phone_call_outline, size: 20),
                            Gap(15),
                            Text(
                              '+911234567890',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Gap(10),
                        Row(
                          children: [
                            Icon(EvaIcons.email_outline, size: 23),
                            Gap(15),
                            Text(
                              'someone@gmail.com',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Gap(10),
                        Row(
                          children: [
                            Icon(EvaIcons.map_outline, size: 23),
                            Gap(15),
                            Text(
                              'Naigaon (East), Tal. Vasai, \nDist. Palghar, Maharashtra 401208',
                              style: TextStyle(fontSize: 15),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        tooltip: 'Action',
        child: const Icon(Icons.add),
      ),
    );
  }
}
