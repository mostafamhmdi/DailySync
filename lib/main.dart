import 'package:dailysync/ui/splash_screen.dart';
import 'package:dailysync/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DailySync());
}

class DailySync extends StatelessWidget {
  const DailySync({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailySync',
        theme: ThemeData(
        // Define the default background color here
        scaffoldBackgroundColor: primaryColor, // Set your desired background color


    ),
      home: const SplashScreen(),
    );
  }
}

