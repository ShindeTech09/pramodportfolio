import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageViewerWidget extends StatelessWidget {
  const ImageViewerWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(20.0),
            ),
          );
        },
        errorWidget:
            (context, url, error) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
      ),
    );
  }
}
