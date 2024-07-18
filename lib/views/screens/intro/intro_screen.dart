import 'package:flutter/material.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:get/get.dart';
import '../../../controller/intro_screen_controller.dart';
import '../../../utils/app_theme.dart';
import '../home._menu.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final introController = Get.put(IntroScreenController());
    return Scaffold(
        body:  Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: primaryColor),
              child: Padding(
                padding: const EdgeInsets.all(kPadding15),
                child: ListView(
                  children: [
                    Text(
                      "What league do you interested ?",
                      style: TextStyle(color: whiteColor, fontSize: 30),
                    ),
                    kSizedBoxH20,
                    Text(
                      "You can choose more than one",
                      style: TextStyle(color: greyColor, fontSize: 20),
                    ),
                    kSizedBoxH20,
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: introController.sportIconList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: kPadding10,
                            crossAxisSpacing: kPadding10,
                            childAspectRatio: 1.5,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Obx(()=>
                            GestureDetector(
                              onTap: () {
                                introController.selectSport(index);
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color:introController.selectedSportIndex.contains(index)?secondaryColor: greyColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        introController.sportIconList[index].icon,
                                        height: 70,
                                        width: 70,
                                      ),
                                      Text(
                                        introController.sportIconList[index].name,
                                        style: TextStyle(
                                            color: lightWhiteColor, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));



                    }),
                kSizedBoxH20,
                MaterialButton(
                  onPressed: () {
                    Get.to(Home());
                  },
                  color: secondaryColor,
                  padding: const EdgeInsets.all(kPadding15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Next",
                    style: TextStyle(color: whiteColor, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
