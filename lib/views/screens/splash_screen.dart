import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigController = Get.put(AppConfigController());
    //final splashScreenController = Get.put(SplashScreenController());
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(color: cardColor),
        child: Center(
          child: Lottie.asset('assets/images/score_wp.json'),
        ),
      ),
    );
  }
}
