import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      highlightColor: Colors.white60,
      onPressed: onPressed,
      icon: Icon(icon, size: 30.0),
    );
  }
}
