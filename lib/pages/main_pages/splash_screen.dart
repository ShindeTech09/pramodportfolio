import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _lightController;
  late AnimationController _zoomController;
  late Animation<double> _zoomAnimation;
  late AnimationController _fadeTextController;
  final List<String> messages = [
    "Adjusting Aperture...",
    "Focusing Lens...",
    "Framing Memories...",
    "Final Touch in Progress...",
    "Ready to Capture!",
  ];

  int _textIndex = 0;
  String _currentText = "";

  @override
  void initState() {
    super.initState();

    _lightController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _zoomController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _zoomAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _zoomController, curve: Curves.easeInOut),
    );

    _fadeTextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _startSequence();
  }

  Future<void> _startSequence() async {
    await Future.delayed(const Duration(milliseconds: 30));
    _lightController.forward();

    // Play shutter sound once

    // Cycle through loading messages
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_textIndex < messages.length) {
        setState(() {
          _currentText = messages[_textIndex];
        });
        _fadeTextController.forward(from: 0.0);
        _textIndex++;
      } else {
        timer.cancel();
        _zoomController.forward();
        Future.delayed(const Duration(seconds: 3), _goToHome);
      }
    });
  }

  void _goToHome() {
    Get.offAllNamed('/home');
  }

  @override
  void dispose() {
    _lightController.dispose();
    _zoomController.dispose();
    _fadeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _lightController,
        builder: (context, child) {
          final lightValue = _lightController.value;

          return Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              // Background image with opacity
              if (lightValue > 0.2)
                Opacity(
                  opacity: 0.25 + 0.5 * lightValue,
                  child: ScaleTransition(
                    scale: _zoomAnimation,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Color.fromARGB(255, 6, 9, 30),
                    ),
                  ),
                ),

              // Logo Fade-in
              Positioned(
                height: 300,
                top: screenWidth > 1024 ? 180 : 90,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: lightValue,
                  child: Image(
                    image: AssetImage(
                      'assets/images/Creative-Capture_logo.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Loading Text Messages
              Positioned(
                bottom: screenWidth > 800 ? 160 : 250,
                child: FadeTransition(
                  opacity: _fadeTextController,
                  child: Text(
                    _currentText,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                    ),
                  ),
                ),
              ),

              // Tagline at end
              if (lightValue > 0.75)
                Positioned(
                  bottom: 80,
                  left: 20,
                  right: 20,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(
                        0,
                        0.5,
                      ), // Start slightly below the screen
                      end: Offset.zero, // End at the original position
                    ).animate(
                      CurvedAnimation(
                        parent: _lightController,
                        curve: Curves.easeOut, // Smooth slide-in effect
                      ),
                    ),
                    child: Text(
                      "\"Capturing life’s most precious moments with care, creativity, and a touch of warmth.\"",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
