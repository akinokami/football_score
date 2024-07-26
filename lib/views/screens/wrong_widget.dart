import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:get/get.dart';

import '../widgets/custom_text.dart';

class WrongWidget extends StatelessWidget {
  const WrongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigController = Get.put(AppConfigController());
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error,
              size: 70.sp,
              color: Colors.white,
            ),
            CustomText(
              text: 'Something went wrong',
              size: 14.sp,
            ),
            SizedBox(height: 30.h),
            Obx(
              () => appConfigController.isLoading.value
                  ? const CircularProgressIndicator()
                  : TextButton(
                      onPressed: () {
                        appConfigController.getAppConfig('');
                      },
                      child: CustomText(
                        text: 'Retry',
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
