import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/language_controller.dart';
import '../../utils/app_theme.dart';
import '../../utils/global.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: lightWhiteColor),
        title: Text('policy'.tr, style: TextStyle(color: lightWhiteColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(languageController.language.value=="en"?Global.policyEn:Global.policyCn, style: TextStyle(color: lightWhiteColor, fontSize: 14)),
            )
          ],
        ),
      )
      ,
    );
  }
}
