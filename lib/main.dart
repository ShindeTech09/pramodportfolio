import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pramod_portfolio/pages/about_page.dart';
import 'package:pramod_portfolio/pages/blog_page.dart';
import 'package:pramod_portfolio/pages/contact_page.dart';

import 'package:pramod_portfolio/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/home',
            page: () => const HomePage(),
            transition: Transition.cupertinoDialog,
            transitionDuration: const Duration(milliseconds: 500),
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
        ],
        theme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
