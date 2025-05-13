import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class WidgetValues {
  static IconData facebookIcon = FontAwesome.facebook_f_brand;
  static IconData instagramIcon = FontAwesome.instagram_brand;
  static IconData pinterestIcon = FontAwesome.pinterest_p_brand;
  static IconData twitterIcon = FontAwesome.x_twitter_brand;

  static CarouselOptions carouselOptions = CarouselOptions(
    autoPlay: true,
    enlargeCenterPage: true,
    viewportFraction: 0.99,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );

  static AppBar appBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      excludeHeaderSemantics: true,
      leadingWidth:
          screenWidth > 1024
              ? 300 // Larger width for desktop
              : screenWidth > 768
              ? 200 // Medium width for tablets
              : 150, // Smaller width for mobile
      leading: Image(
        image: const AssetImage('assets/images/Creative-Capture_logo.png'),
        fit: BoxFit.contain, // Ensure the logo scales properly
      ),
      toolbarHeight: 150.0,
      backgroundColor: const Color.fromARGB(
        78,
        0,
        0,
        0,
      ), // Make the AppBar transparent
      elevation: 0, // Remove shadow
      actions:
          screenWidth > 1024
              ? _buildDesktopActions(context) // Desktop layout
              : _buildMobileActions(context), // Mobile layout
    );
  }

  static List<Widget> _buildDesktopActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          Get.offAllNamed('/home');
        },
        child: Text('HOME', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
      ),
      Gap(30),
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(40),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          iconSize: 0.0,
          dropdownColor: const Color.fromARGB(126, 0, 0, 0),
          style: GoogleFonts.hedvigLettersSans(
            fontSize: 17,
            color: Colors.white,
          ),
          items: [
            DropdownMenuItem(value: 'Event', child: Text('Events Gallery')),
            DropdownMenuItem(
              value: 'Portrait',
              child: Text('Portraits Gallery'),
            ),
            DropdownMenuItem(value: 'PreWedding', child: Text('Pre Wedding')),
          ],
          onChanged: (value) {
            if (value == 'Event') {
              Get.toNamed('/event');
            } else if (value == 'Portrait') {
              Get.toNamed('/portrait');
            } else if (value == 'PreWedding') {
              Get.toNamed('/preWedding');
            }
          },
          hint: Text(
            'PHOTO GALLERY',
            style: GoogleFonts.hedvigLettersSans(
              fontSize: 17,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      const Gap(30),
      TextButton(
        onPressed: () {
          Get.toNamed('/blog');
        },
        child: Text('BLOG', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
      ),
      const Gap(30),
      TextButton(
        onPressed: () {
          Get.toNamed('/bio');
        },
        child: Text('BIO', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
      ),
      const Gap(30),
      TextButton(
        onPressed: () {
          Get.toNamed('/contact');
        },
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
        color: const Color.fromARGB(192, 0, 0, 0),
        borderRadius: BorderRadius.circular(40),
        padding: const EdgeInsets.only(right: 30),
        icon: Icon(
          FontAwesome.bars_progress_solid,
          color: Theme.of(context).colorScheme.primary,
          size: 35,
        ),
        onSelected: (value) {
          if (value == 'Home') {
            Get.offAllNamed('/home');
          } else if (value == 'PhotoGallery') {
            // Handle Photo Gallery Dropdown
          } else if (value == 'Blog') {
            Get.toNamed('/blog');
          } else if (value == 'Bio') {
            Get.toNamed('/bio');
          } else if (value == 'Contact') {
            Get.toNamed('/contact');
          }
        },
        itemBuilder:
            (context) => [
              const PopupMenuItem(value: 'Home', child: Text('HOME')),
              PopupMenuItem(
                value: 'PhotoGallery',
                textStyle: GoogleFonts.hedvigLettersSans(
                  fontSize: 15,
                  color: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    iconSize: 0.0,
                    dropdownColor: const Color.fromARGB(192, 0, 0, 0),
                    hint: Text(
                      'PHOTO GALLERY',
                      style: GoogleFonts.hedvigLettersSans(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),

                    items: [
                      DropdownMenuItem(
                        value: 'Event',
                        child: Text(
                          'Events Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Portrait',
                        child: Text(
                          'Portraits Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'PreWedding',
                        child: Text(
                          'Pre Wedding',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == 'Event') {
                        Get.toNamed('/event');
                      } else if (value == 'Portrait') {
                        Get.toNamed('/portrait');
                      } else if (value == 'PreWedding') {
                        Get.toNamed('/preWedding');
                      }
                    },
                  ),
                ),
              ),
              const PopupMenuItem(value: 'Blog', child: Text('BLOG')),
              const PopupMenuItem(value: 'Bio', child: Text('BIO')),
              const PopupMenuItem(value: 'Contact', child: Text('CONTACT')),
            ],
      ),
    ];
  }
}
