import 'package:flutter/material.dart';

class ImageViewerWidget extends StatelessWidget {
  const ImageViewerWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        image: AssetImage(imagePath),
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
        },
      ),
    );
  }
}
