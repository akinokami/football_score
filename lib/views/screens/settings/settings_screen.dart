import 'package:flutter/material.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/privacy_policy_screen.dart';
import 'package:get/get.dart';

import '../../../controller/language_controller.dart';
import '../../../utils/app_theme.dart';
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
          title: Text('settings'.tr, style: TextStyle(color: lightWhiteColor)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Text('general'.tr,
                  style: TextStyle(
                      color: lightWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),

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
                                width: 20,
                                height: 30,
                              ),
                              kSizedBoxW10,
                              Text('language'.tr,
                                  style: TextStyle(
                                      color: lightWhiteColor, fontSize: 14)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                                languageController.language.value == "en"
                                    ? 'english'.tr
                                    : languageController.language.value == "vi"
                                        ? 'vietnam'.tr
                                        : 'chinese'.tr,
                                style: TextStyle(
                                    color: lightWhiteColor, fontSize: 14)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: lightWhiteColor,
                                size: 20,
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
              Text('other'.tr,
                  style: TextStyle(
                      color: lightWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
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
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.privacy_tip_outlined,
                                color: lightWhiteColor,
                                size: 20,
                              ),
                              kSizedBoxW10,
                              Text('policy'.tr,
                                  style: TextStyle(
                                      color: lightWhiteColor, fontSize: 14)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: lightWhiteColor,
                            size: 20,
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outlined,
                              color: lightWhiteColor,
                              size: 20,
                            ),
                            kSizedBoxW10,
                            Text('version'.tr,
                                style: TextStyle(
                                    color: lightWhiteColor, fontSize: 14)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15),
                        child: Text(appVersion,
                            style: TextStyle(
                                color: lightWhiteColor, fontSize: 14)),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
