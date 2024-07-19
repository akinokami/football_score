import 'package:football_score/views/screens/home._menu.dart';
import 'package:football_score/views/screens/intro/intro_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  String first = '';
  @override
  void onInit() {
    final box = GetStorage();
    first = box.read('first') ?? '';

    Future.delayed(const Duration(seconds: 2), () {
      (first == '')
          ? Get.to(() => const IntroScreen())
          : Get.to(() => HomeMenu());
    });

    super.onInit();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }
}
