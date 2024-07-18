import 'package:flutter/material.dart';
import 'package:football_score/views/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:football_score/views/screens/home._menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Football Score',
      theme: ThemeData(
       useMaterial3: true
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );

  }
}
