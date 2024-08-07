import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/privacy_policy_screen.dart';
import 'package:get/get.dart';

import '../../../controller/language_controller.dart';
import '../../../utils/app_theme.dart';
import '../../widgets/custom_text.dart';
import '../change_language.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //iconTheme: IconThemeData(color: lightWhiteColor),
          backgroundColor: primaryColor,
          title: CustomText(text:'settings'.tr,size: 16.sp,fontWeight: FontWeight.bold,),
          centerTitle: true,
        ),
        body: Padding(
          padding:  EdgeInsets.all(10.w),
          child: ListView(
            children: [
              CustomText(text:'general'.tr,
                 size: 14.sp,),

              GestureDetector(
                onTap: () {
                  Get.to(const ChangeLanguageScreen());
                },
                child: Card(
                    color: cardColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/chnage_lan.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              kSizedBoxW10,
                              CustomText(text:'language'.tr,
                                fontWeight: FontWeight.w400,
                                size: 12.sp,
                                  ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            CustomText(
                               text: languageController.language.value == "en"
                                    ? 'english'.tr
                                    : languageController.language.value == "vi"
                                        ? 'vietnam'.tr
                                        : 'chinese'.tr,
                              size: 12.sp,
                              textColor: lightWhiteColor,
                               ),
                            Padding(
                              padding:  EdgeInsets.all(8.w),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: lightWhiteColor,
                                size: 18.w,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              kSizedBoxH20,
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Divider(color: lightWhiteColor,),
              // ),
              CustomText(text:'other'.tr,
                 size: 14.sp,),
              GestureDetector(
                onTap: () {
                  Get.to(const PrivacyPolicyScreen());
                },
                child: Card(
                    color: cardColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.w),
                          child: Row(
                            children: [
                              Icon(
                                Icons.privacy_tip_outlined,
                                color: lightWhiteColor,
                                size: 18.w,
                              ),
                              kSizedBoxW10,
                              Text('policy'.tr,
                                  style: TextStyle(
                                      color: lightWhiteColor, fontSize: 12.sp)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: lightWhiteColor,
                            size: 20.w,
                          ),
                        ),
                      ],
                    )),
              ),
              kSizedBoxH10,
              Card(
                  color: cardColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(10.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outlined,
                              color: lightWhiteColor,
                              size: 18.w,
                            ),
                            kSizedBoxW10,
                            Text('version'.tr,
                                style: TextStyle(
                                    color: lightWhiteColor, fontSize: 12.sp)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15),
                        child: Text(appVersion,
                            style: TextStyle(
                                color: lightWhiteColor, fontSize: 12.sp)),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
