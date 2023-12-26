import 'package:ai_imagegenerator_app/colors.dart';
import 'package:ai_imagegenerator_app/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Image Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'poppins',
          scaffoldBackgroundColor: bgColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )),
      home: const HomeScreen(),
    );
  }
}
