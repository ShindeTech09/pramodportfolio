import 'package:flutter/material.dart';

class EventCards extends StatefulWidget {
  const EventCards({
    super.key,
    required this.imagePath,
    required this.textTitle,
  });

  final String imagePath;
  final String textTitle;

  @override
  State<EventCards> createState() => _EventCardsState();
}

class _EventCardsState extends State<EventCards> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 20.0,
      child: MouseRegion(
        onEnter:
            (_) => setState(() {
              _isHovered = true;
            }),
        onExit:
            (_) => setState(() {
              _isHovered = false;
            }),

        child:
            screenWidth > 1024
                ? _buildDesktopActions(
                  context,
                  _isHovered,
                  widget.imagePath,
                  widget.textTitle,
                )
                : _buildMobileActions(
                  context,
                  widget.imagePath,
                  widget.textTitle,
                ),
      ),
    );
  }
}

Widget _buildMobileActions(
  BuildContext context,
  String imagePath,
  String textTitle,
) {
  return Stack(
    children: [
      Center(
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 5000),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
            ),
          ),
        ),
      ),
      AnimatedOpacity(
        opacity: 0.9,
        duration: Duration(milliseconds: 500),
        child: Center(
          child: Text(
            textTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildDesktopActions(
  BuildContext context,
  bool isHovered,
  String imagePath,
  String textTitle,
) {
  return Stack(
    children: [
      Center(
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 5000),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                opacity: isHovered ? 0.1 : 0.9,
              ),
            ),
          ),
        ),
      ),
      AnimatedOpacity(
        opacity: isHovered ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Center(
          child: Text(
            textTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
