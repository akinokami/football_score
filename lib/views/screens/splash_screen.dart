import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/splash_screen_controller.dart';
import '../../utils/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashScreenController = Get.put(SplashScreenController());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: cardColor),
        child: Center(
          child: Lottie.asset('assets/images/score_wp.json'),
        ),
      ),
    );
  }
}
