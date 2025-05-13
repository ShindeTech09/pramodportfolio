import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pramod_portfolio/firebase_options.dart';
import 'package:pramod_portfolio/ignore_folder/appbar.dart';
import 'package:pramod_portfolio/pages/splash_screen.dart';
import 'package:pramod_portfolio/pages/main_pages/about_page.dart';
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
            page: () => const HomePage(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 900),
          ),
          GetPage(
            name: '/contact',
            page: () => const ContactPage(),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/blog',
            page: () => const BlogPage(),
            transition: Transition.cupertinoDialog,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/bio',
            page: () => const AboutPage(),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/event',
            page: () => const EventGalleryPage(),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/preWedding',
            page: () => const PreWeddingGalleryPage(),
            transition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
          ),
          GetPage(
            name: '/portrait',
            page: () => const PortraitGalleryPage(),
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
