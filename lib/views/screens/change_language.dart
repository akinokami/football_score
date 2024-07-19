import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/language_controller.dart';
import '../../utils/app_theme.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: lightWhiteColor),
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text('change_language'.tr,
            style: TextStyle(color: lightWhiteColor)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  languageController.changeLanguage("en", "US");
                },
                child: Card(
                  color: cardColor,
                  child: ListTile(
                    leading: Image.asset(
                      "assets/images/usa.webp",
                      width: 20,
                      height: 30,
                    ),
                    title: Text(
                      "English",
                      style: TextStyle(color: lightWhiteColor),
                    ),
                    trailing: Icon(
                      languageController.language.value == "en"
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      color: languageController.language.value == "en"
                          ? secondaryColor
                          : lightWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  languageController.changeLanguage("zh", "CN");
                },
                child: Card(
                  color: cardColor,
                  child: ListTile(
                    leading: Image.asset(
                      "assets/images/china.webp",
                      width: 20,
                      height: 30,
                    ),
                    title: Text(
                      "中国人",
                      style: TextStyle(color: lightWhiteColor),
                    ),
                    trailing: Icon(
                      languageController.language.value == "zh"
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      color: languageController.language.value == "zh"
                          ? secondaryColor
                          : lightWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
            // Spacer(),
            // MaterialButton(onPressed: (){},child: Text("Save",style: TextStyle(color: lightWhiteColor),),color: secondaryColor,elevation: 0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
            // kSizedBoxH10
          ],
        ),
      ),
    );
  }
}
