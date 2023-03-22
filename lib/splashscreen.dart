import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: const Text('Cat and Dog Classifier',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Color(0x00FFFF)
        ),
      ),
      image: Image.asset(''),
    );
  }
}