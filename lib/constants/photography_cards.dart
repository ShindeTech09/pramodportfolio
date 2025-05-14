import 'package:flutter/material.dart';
import 'package:pramod_portfolio/constants/event_cards.dart';
import 'package:pramod_portfolio/constants/string_values.dart';

class PhotographyCards extends StatelessWidget {
  const PhotographyCards({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust grid layout and padding based on screen width
    final int crossAxisCount =
        screenWidth > 1024
            ? 3
            : screenWidth > 768
            ? 2
            : 1; // Number of columns for desktop, tablet, and mobile
    final double horizontalPadding =
        screenWidth > 1024
            ? 100
            : screenWidth > 768
            ? 50
            : 20; // Adjust horizontal padding
    final double verticalPadding =
        screenWidth > 1024
            ? 40
            : screenWidth > 768
            ? 30
            : 20; // Adjust vertical padding
    final double cardHeight =
        screenWidth > 1024
            ? 300
            : screenWidth > 768
            ? 250
            : 200; // Adjust card height

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 3 / 2, // Adjust aspect ratio for better layout
        ),
        itemCount: _photographyItems.length,
        itemBuilder: (context, index) {
          final item = _photographyItems[index];
          return SizedBox(
            height: cardHeight,
            child: EventCards(
              imagePath: item['imagePath']!,
              textTitle: item['textTitle']!,
            ),
          );
        },
      ),
    );
  }

  // List of photography items
  List<Map<String, String>> get _photographyItems => [
    {'imagePath': StringValues.cardSlider1, 'textTitle': 'Event Photography'},
    {
      'imagePath': StringValues.cardSlider2,
      'textTitle': 'Pre Wedding Photography',
    },
    {'imagePath': StringValues.cardSlider6, 'textTitle': 'Wedding Photography'},
    {
      'imagePath': StringValues.cardSlider3,
      'textTitle': 'Corporate Photography',
    },
    {
      'imagePath': StringValues.cardSlider4,
      'textTitle': 'Portrait Photography',
    },
    {'imagePath': StringValues.cardSlider5, 'textTitle': 'Food Photography'},
    {
      'imagePath': StringValues.cardSlider7,
      'textTitle': 'Baby Shower Photography',
    },
  ];
}
