import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pramod_portfolio/constants/image_viewer_widget.dart';
import 'package:pramod_portfolio/constants/string_values.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class ImageViewSlider extends StatelessWidget {
  const ImageViewSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (int i = 0; i < StringValues.homePageSLiderImages.length; i++)
          ImageViewerWidget(imagePath: StringValues.homePageSLiderImages[i]),
      ],
      options: WidgetValues.carouselOptions,
    );
  }
}
