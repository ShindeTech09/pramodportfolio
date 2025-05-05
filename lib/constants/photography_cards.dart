import 'package:flutter/material.dart';
import 'package:pramod_portfolio/constants/event_cards.dart';
import 'package:pramod_portfolio/constants/string_values.dart';

class PhotographyCards extends StatelessWidget {
  const PhotographyCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: GridView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        children: [
          EventCards(
            imagePath: StringValues.cardSlider1,
            textTitle: 'Event Photography',
          ),
          EventCards(
            imagePath: StringValues.cardSlider2,
            textTitle: 'Pre Wedding Photography',
          ),
          EventCards(
            imagePath: StringValues.cardSlider6,
            textTitle: 'Wedding Photography',
          ),
          EventCards(
            imagePath: StringValues.cardSlider3,
            textTitle: 'Corporate Photography',
          ),
          EventCards(
            imagePath: StringValues.cardSlider4,
            textTitle: 'Portrait Photography',
          ),
          EventCards(
            imagePath: StringValues.cardSlider5,
            textTitle: 'Food Photography',
          ),
          EventCards(
            imagePath: StringValues.cardSlider3,
            textTitle: 'Food Photography',
          ),
        ],
      ),
    );
  }
}
