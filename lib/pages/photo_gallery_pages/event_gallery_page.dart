import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class EventGalleryPage extends StatelessWidget {
  const EventGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetValues.appBar(context),
      body: SingleChildScrollView(
        child: Center(
          widthFactor: Get.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Event Gallery',
                style: GoogleFonts.abhayaLibre(fontSize: 50.0),
              ),
              Gap(20.0),
              SizedBox(
                height: 2000,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, no) {
                    return GridTile(
                      child: Center(
                        child: Image(
                          image: NetworkImage(
                            'https://drive.google.com/uc?export=view&id=1HdHhTigEaCWL2fbLfYpmWw_Ofd43-p10',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
