import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          GetPage(name: '/home', page: () => const HomePage()),
          GetPage(name: '/contact', page: () => const ContactPage()),
        ],
        theme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
