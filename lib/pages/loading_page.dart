
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(PramodPhotographyApp());

class PramodPhotographyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
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
  String currentText = "";
  int textIndex = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _lightController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _fadeTextController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _zoomController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _zoomAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _zoomController, curve: Curves.easeInOut),
    );

    _startAnimationSequence();
  }

  Future<void> _startAnimationSequence() async {
    await Future.delayed(Duration(milliseconds: 500));
    _lightController.forward();
    _playSound('assets/mp3/camera-shutter-187326.mp3');

    // Cycle through loading texts
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (textIndex < messages.length) {
        setState(() => currentText = messages[textIndex]);
        _fadeTextController.forward(from: 0.0);
        textIndex++;
      } else {
        timer.cancel();
        _zoomController.forward();
        Future.delayed(Duration(seconds: 4), _goToHome);
      }
    });
  }

  void _playSound(String assetPath) async {
    await _audioPlayer.play(AssetSource(assetPath));
  }

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, anim1, anim2) => HomePage(),
        transitionsBuilder:
            (context, anim1, anim2, child) =>
                FadeTransition(opacity: anim1, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _lightController.dispose();
    _zoomController.dispose();
    _fadeTextController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _lightController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(
            1.0 - _lightController.value.clamp(0.0, 1.0),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              if (_lightController.value > 0.6)
                ScaleTransition(
                  filterQuality: FilterQuality.low,
                  scale: _zoomAnimation,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0XFF1E223D),
                  ),
                ),
              if (_lightController.value > 0.3)
                FadeTransition(
                  opacity: _fadeTextController,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      currentText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              if (_lightController.value > 0.8)
                Positioned(
                  bottom: 50,
                  child: Text(
                    "\"Capturing life’s most precious moments with care, creativity, and a touch of warmth.\"",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                top: 150,
                child: Center(
                  child: AnimatedOpacity(
                    opacity: _lightController.value,
                    duration: Duration(seconds: 2),
                    child: CircleAvatar(
                      radius: 100.0,
                      foregroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome to Pramod Photography!")),
    );
  }
}
