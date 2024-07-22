import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/language_controller.dart';
import '../../utils/app_theme.dart';
import '../widgets/custom_text.dart';

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
        title:CustomText(text:'change_language'.tr,size: 16.sp,fontWeight: FontWeight.bold,)

      ),
      body: Obx(()=>

        Stack(
          children: [
            Padding(
              padding:  EdgeInsets.all(10.w),
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
                            width: 20.w,
                            height: 20.h,
                          ),
                          title: CustomText(
                            text:"English",
                           textColor: lightWhiteColor,
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
                            width: 20.w,
                            height: 20.h,
                          ),
                          title: CustomText(
                            text:"中国人",
                              textColor: lightWhiteColor,
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
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        languageController.changeLanguage("vi", "VN");
                      },
                      child: Card(
                        color: cardColor,
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/vietnam.webp",
                            width: 20.w,
                            height: 20.h,
                          ),
                          title: CustomText(
                            text: "Tiếng Việt",
                            textColor: lightWhiteColor,
                          ),
                          trailing: Icon(
                            languageController.language.value == "vi"
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value == "vi"
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
           languageController.isLoading.value ? Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              child: const Center(
                child: CircularProgressIndicator(), // Loading indicator
              ),
           ): const SizedBox.shrink(), // If not loading, don't show anything

          ],
        ),
      ),
    );
  }
}
