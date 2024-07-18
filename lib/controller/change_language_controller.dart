import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeLanguageController extends GetxController {
  RxBool isEnglish = true.obs;
  void changeLanguage(String languageCode,BuildContext context) {
   context.setLocale( Locale(languageCode));
   if(languageCode == 'en'){
     isEnglish.value = true;
  }else{
    isEnglish.value = false;
  }}

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }
}
