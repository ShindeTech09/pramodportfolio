import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pramod_portfolio/constants/image_viewer_widget.dart';
import 'package:pramod_portfolio/constants/string_values.dart';


class ImageViewSlider extends StatelessWidget {
  const ImageViewSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ImageViewerWidget(imagePath: StringValues.image1),
        ImageViewerWidget(imagePath: StringValues.image2),
        ImageViewerWidget(imagePath: StringValues.image3),
        ImageViewerWidget(imagePath: StringValues.image4),
        ImageViewerWidget(imagePath: StringValues.image5),
      ],
      options: StringValues.carouselOptions,
    );
  }
}
