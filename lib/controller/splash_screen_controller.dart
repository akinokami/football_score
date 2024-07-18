import 'package:football_score/views/screens/intro/intro_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {


  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const IntroScreen());
    });
    super.onInit();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }
}