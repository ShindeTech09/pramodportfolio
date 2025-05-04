import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      highlightColor: Colors.white60,
      onPressed: () {},
      icon: Icon(icon, size: 30.0),
    );
  }
}
