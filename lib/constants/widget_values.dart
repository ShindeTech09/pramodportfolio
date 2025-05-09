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
    return AppBar(
      toolbarHeight: 90.0,
      backgroundColor: Colors.transparent,
      title: const Text('Pramod Photography'),
      titleTextStyle: GoogleFonts.robotoSerif(
        textStyle: TextStyle(
          letterSpacing: 2,
          fontSize: 40,
          color: Colors.white,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.offAllNamed('/home');
          },
          child: Text(
            'HOME',
            style: GoogleFonts.hedvigLettersSans(fontSize: 17),
          ),
        ),
        Gap(30),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              'PHOTO GALLERY',
              style: GoogleFonts.hedvigLettersSans(fontSize: 17),
            ),
            items: [
              DropdownMenuItem(
                value: 'Event',
                child: Text(
                  'Events Gallery',
                  style: GoogleFonts.hedvigLettersSans(fontSize: 15),
                ),
              ),
              DropdownMenuItem(
                value: 'Portrait',
                child: Text(
                  'Portraits Gallery',
                  style: GoogleFonts.hedvigLettersSans(fontSize: 15),
                ),
              ),
              DropdownMenuItem(
                value: 'PreWedding',
                child: Text(
                  'Pre Wedding',
                  style: GoogleFonts.hedvigLettersSans(fontSize: 15),
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
        // Builder(
        //   builder:
        //       (context) => DropdownButtonHideUnderline(
        //         child: DropdownButton<String>(
        //           style: GoogleFonts.hedvigLettersSans(
        //             fontSize: 17,
        //             color: Colors.white,
        //           ),
        //           items: [
        //             DropdownMenuItem(
        //               value: 'Event',
        //               child: Text('Events Gallery'),
        //             ),
        //             DropdownMenuItem(
        //               value: 'Portrait',
        //               child: Text('Portraits Gallery'),
        //             ),
        //             DropdownMenuItem(
        //               value: 'PreWedding',
        //               child: Text('Pre Wedding'),
        //             ),
        //           ],
        //           onChanged: (value) {
        //             if (value == 'Event') {
        //               Get.toNamed('/event');
        //             } else if (value == 'Portrait') {
        //               Get.toNamed('/portrait');
        //             } else if (value == 'PreWedding') {
        //               Get.toNamed('/preWedding');
        //             }
        //           },
        //           hint: Text(
        //             'PHOTO GALLERY',
        //             style: GoogleFonts.hedvigLettersSans(
        //               fontSize: 17,
        //               color: Theme.of(context).primaryTextTheme.bodyMedium!.color,
        //             ),
        //           ),
        //         ),
        //       ),
        // ),
        Gap(30),
        TextButton(
          onPressed: () {
            Get.toNamed('/blog');
          },
          child: Text(
            'BLOG',
            style: GoogleFonts.hedvigLettersSans(fontSize: 17),
          ),
        ),
        Gap(30),
        TextButton(
          onPressed: () {
            Get.toNamed('/bio');
          },
          child: Text(
            'BIO',
            style: GoogleFonts.hedvigLettersSans(fontSize: 17),
          ),
        ),
        Gap(30),
        TextButton(
          onPressed: () {
            Get.toNamed('/contact');
          },
          child: Text(
            'CONTACT',
            style: GoogleFonts.hedvigLettersSans(fontSize: 17),
          ),
        ),
        Gap(30),
      ],
    );
  }
}
