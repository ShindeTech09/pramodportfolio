import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

class StringValues {
  static String image1 = 'assets/images/wp2767331-4k-desktop-backgrounds.jpg';
  static String image2 = 'assets/images/wp2767332-4k-desktop-backgrounds.jpg';
  static String image3 = 'assets/images/wp2767334-4k-desktop-backgrounds.jpg';
  static String image4 = 'assets/images/wp2767350-4k-desktop-backgrounds.jpg';
  static String image5 = 'assets/images/wp2767395-4k-desktop-backgrounds.jpg';
  static String bgImage = 'assets/images/bg_image-removebg-preview.png';
  static String cardSlider1 = 'assets/card_slider/card_slider1.png';
  static String cardSlider2 = 'assets/card_slider/card_slider2.png';
  static String cardSlider3 = 'assets/card_slider/card_slider3.png';
  static String cardSlider4 = 'assets/card_slider/card_slider4.png';
  static String cardSlider5 = 'assets/card_slider/card_slider5.png';
  static String cardSlider6 = 'assets/card_slider/card_slider6.png';
  static IconData facebookIcon = FontAwesome.facebook_f_brand;
  static IconData instagramIcon = FontAwesome.instagram_brand;
  static IconData pinterestIcon = FontAwesome.pinterest_p_brand;
  static IconData twitterIcon = FontAwesome.x_twitter_brand;
  static String emailID = 'pramodcreativecaptures@gmail.com';
  static String phoneNumber = '+91 7039691810';
  static CarouselOptions carouselOptions = CarouselOptions(
    autoPlay: true,
    enlargeCenterPage: true,
    viewportFraction: 0.99,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
  static AppBar appBar = AppBar(
    toolbarHeight: 90.0,
    backgroundColor: Colors.transparent,
    title: const Text('Pramod Photography'),
    titleTextStyle: GoogleFonts.robotoSerif(
      textStyle: TextStyle(letterSpacing: 2, fontSize: 40, color: Colors.white),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Get.offAllNamed('/home');
        },
        child: Text('HOME', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
      ),
      Gap(30),
      TextButton(
        onPressed: () {},
        child: Text(
          'CLIENT\'S GALLERY',
          style: GoogleFonts.hedvigLettersSans(fontSize: 17),
        ),
      ),
      Gap(30),
      TextButton(
        onPressed: () {
          Get.toNamed('/blog',  );
        },
        child: Text('BLOG', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
      ),
      Gap(30),
      TextButton(
        onPressed: () {
          Get.toNamed('/bio');
        },
        child: Text('BIO', style: GoogleFonts.hedvigLettersSans(fontSize: 17)),
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
