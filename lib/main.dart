import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pramod_portfolio/constants/gallery_page_template.dart';
import 'package:pramod_portfolio/constants/string_values.dart';
import 'package:pramod_portfolio/firebase_options.dart';
import 'package:pramod_portfolio/pages/splash_screen.dart';
import 'package:pramod_portfolio/pages/main_pages/bio_page.dart';
import 'package:pramod_portfolio/pages/main_pages/blog_page.dart';
import 'package:pramod_portfolio/pages/main_pages/contact_page.dart';
import 'package:pramod_portfolio/pages/photo_gallery_pages/event_gallery_page.dart';
import 'package:pramod_portfolio/pages/main_pages/home_page.dart';
import 'package:pramod_portfolio/pages/photo_gallery_pages/portrait_gallery_page.dart';
import 'package:pramod_portfolio/pages/photo_gallery_pages/pre_wedding_gallery.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const PramodPhotographyApp());
}

class PramodPhotographyApp extends StatelessWidget {
  const PramodPhotographyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: "Pramod Portfolio",
        initialRoute: '/loading',
        getPages: [
          GetPage(
            name: '/loading',
            page: () => SplashScreen(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/home',
            page: () => HomePage(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 900),
          ),
          GetPage(
            name: '/contact',
            page: () => ContactPage(),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/blog',
            page: () => BlogPage(),
            transition: Transition.cupertinoDialog,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/bio',
            page: () => BioPage(),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/event',
            // page: () => EventGalleryPage(),
            page:
                () => GalleryPageTemplate(
                  pageTitle: 'Event Gallery',
                  imageList: StringValues.eventGalleryImages,
                ),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/preWedding',
            // page: () => PreWeddingGalleryPage(),
            page:
                () => GalleryPageTemplate(
                  pageTitle: 'Pre Wedding Gallery',
                  imageList: StringValues.preWeddingGalleryImages,
                ),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/portrait',
            // page: () => PortraitGalleryPage(),
            page:
                () => GalleryPageTemplate(
                  pageTitle: 'Portrait Gallery',
                  imageList: StringValues.portraitGalleryImages,
                ),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
        ],
        theme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
