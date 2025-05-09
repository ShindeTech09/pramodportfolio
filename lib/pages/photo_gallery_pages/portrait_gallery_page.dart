import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class PortraitGalleryPage extends StatelessWidget {
  const PortraitGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetValues.appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Portrait Gallery',
              style: GoogleFonts.robotoMono(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
