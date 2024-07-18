import 'package:flutter/material.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:get/get.dart';

import '../../controller/change_language_controller.dart';
import '../../utils/app_theme.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changeLanguageController = Get.put(ChangeLanguageController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: lightWhiteColor),
        centerTitle: true,
        backgroundColor: primaryColor,
        title:  Text('Change Language',style: TextStyle(color: lightWhiteColor)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Obx(()=>
            GestureDetector(
                onTap: (){
                  changeLanguageController.changeLanguage("en",context);
                },
               child: Card(
                 color: cardColor,
                 child: ListTile(
                   leading: Image.asset("assets/images/usa.webp",width: 20,height: 30,),
                    title: Text("English",style: TextStyle(color: lightWhiteColor),),
                    trailing: Icon(changeLanguageController.isEnglish.value?Icons.check_circle:Icons.check_circle_outline,color:changeLanguageController.isEnglish.value==true?secondaryColor: lightWhiteColor,),
                 ),
               ),
             ),
           ),
            Obx(()=>
              GestureDetector(
                onTap: (){
                  changeLanguageController.changeLanguage("zh",context);
                },
                child: Card(
                  color: cardColor,
                  child: ListTile(
                    leading: Image.asset("assets/images/china.webp",width: 20,height: 30,),
                    title: Text("中国人",style: TextStyle(color: lightWhiteColor),),
                    trailing: Icon(!changeLanguageController.isEnglish.value?Icons.check_circle:Icons.check_circle_outline,color:changeLanguageController.isEnglish.value==true?lightWhiteColor: secondaryColor,),
                  ),
                ),
              ),
            ),
            Spacer(),
            MaterialButton(onPressed: (){},child: Text("Save",style: TextStyle(color: lightWhiteColor),),color: secondaryColor,elevation: 0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
            kSizedBoxH10
          ],
        ),
      ),
    );
  }
}
