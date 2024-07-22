import 'package:flutter/material.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../controller/language_controller.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/global.dart';
import '../../widgets/custom_text.dart';
import '../home._menu.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool isAccepted = false;
  bool isChecked = false;
  String first = '';
  @override
  void initState() {
    //
    super.initState();
//     final box = GetStorage();
//     first = box.read('first') ?? '';
// final languageController = Get.put(LanguageController());
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       if (first == '') {
//         return showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (ctx) => Builder(builder: (context) {
//             return StatefulBuilder(
//               builder: (context, StateSetter setState) {
//                 return AlertDialog(
//                   title: CustomText(
//                     text: 'policy'.tr,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   content: Container(
//                     height: MediaQuery.of(context).size.height * 0.70,
//                     child: SingleChildScrollView(
//                         child: Column(
//                       children: [
//                         Text(languageController.language.value=="en"?Global.policyEn:Global.policyCn, style: TextStyle(fontSize: 12)),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Checkbox(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6)),
//                               activeColor: Colors.green,
//                               side: BorderSide(
//                                 width: 1.5,
//                                 color: isChecked ? Colors.green : Colors.black,
//                               ),
//                               value: isChecked,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   isChecked = value!;
//                                   if (isChecked) {
//                                     isAccepted = true;
//                                   } else {
//                                     isAccepted = false;
//                                   }
//                                 });
//                               },
//                             ),
//                             CustomText(
//                               text: 'I agreed to the Privacy Policy.',
//                               size: 12,
//                               textColor: secondaryColor,
//                             )
//                           ],
//                         ),
//                         MaterialButton(
//                           disabledColor: secondaryColor.withOpacity(0.3),
//                           color: isAccepted ? secondaryColor : greyColor,
//                           child: CustomText(
//                             text: 'Accept',
//                             size: 14,
//                             textColor: Colors.white,
//                           ),
//                           onPressed: isAccepted
//                               ? () {
//                                   final box = GetStorage();
//                                   box.write('first', 'notfirst');
//                                   Navigator.pop(context);
//                                 }
//                               : null,
//                         ),
//                       ],
//                     )),
//                   ),
//                 );
//               },
//             );
//           }),
//         );
//       }
//     });
  }

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: whiteColor),

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: primaryColor),
          child: Padding(
            padding: const EdgeInsets.all(kPadding15),
            child: Column(
              children: [
                // Text(
                //   'what_league'.tr,
                //   style: TextStyle(color: whiteColor, fontSize: 30),
                // ),
                // kSizedBoxH20,
                // Text(
                //   'you_can_choose'.tr,
                //   style: TextStyle(color: greyColor, fontSize: 20),
                // ),
                // kSizedBoxH20,
                // GridView.builder(
                //     shrinkWrap: true,
                //     itemCount: introController.sportIconList.length,
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //             mainAxisSpacing: kPadding10,
                //             crossAxisSpacing: kPadding10,
                //             childAspectRatio: 1.5,
                //             crossAxisCount: 2),
                //     itemBuilder: (context, index) {
                //       return Obx(() => GestureDetector(
                //             onTap: () {
                //               introController.selectSport(index);
                //             },
                //             child: Container(
                //               height: 100,
                //               width: 100,
                //               decoration: BoxDecoration(
                //                   color: introController.selectedSportIndex
                //                           .contains(index)
                //                       ? secondaryColor
                //                       : greyColor,
                //                   borderRadius: BorderRadius.circular(10)),
                //               child: Center(
                //                 child: Column(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceEvenly,
                //                   children: [
                //                     Image.asset(
                //                       introController.sportIconList[index].icon,
                //                       height: 70,
                //                       width: 70,
                //                     ),
                //                     Text(
                //                       introController.sportIconList[index].name,
                //                       style: TextStyle(
                //                           color: lightWhiteColor, fontSize: 14),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ));
                //     }),
                // kSizedBoxH20,
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Text(
                            'first_language'.tr,
                            style: TextStyle(
                                color: lightWhiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                      kSizedBoxH20,
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
                                width: 20,
                                height: 30,
                              ),
                              title: Text(
                                "Tiếng Việt",
                                style: TextStyle(color: lightWhiteColor),
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
                const Spacer(),
                Obx(
                  () => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: MaterialButton(
                      onPressed: () {
                        if (languageController.language.value.isNotEmpty &&
                            first != '') {
                          Get.offAll(HomeMenu());
                        } else {
                          final languageController =
                              Get.put(LanguageController());
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) async {
                            return showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (ctx) => Builder(builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, StateSetter setState) {
                                    return AlertDialog(
                                      title: CustomText(
                                        text: 'policy'.tr,
                                        fontWeight: FontWeight.w500,
                                        textColor: secondaryColor,
                                      ),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.70,
                                        child: SingleChildScrollView(
                                            child: Column(
                                          children: [
                                            Text(
                                                languageController
                                                            .language.value ==
                                                        "en"
                                                    ? Global.policyEn
                                                    :languageController
                                                    .language.value ==
                                                    "zh"? Global.policyCn:Global.policyViet,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: primaryColor)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  activeColor: Colors.green,
                                                  side: BorderSide(
                                                    width: 1.5,
                                                    color: isChecked
                                                        ? Colors.green
                                                        : Colors.black,
                                                  ),
                                                  value: isChecked,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      isChecked = value!;
                                                      if (isChecked) {
                                                        isAccepted = true;
                                                      } else {
                                                        isAccepted = false;
                                                      }
                                                    });
                                                  },
                                                ),
                                                CustomText(
                                                  text: 'agree'.tr,
                                                  size: 12,
                                                  textColor: secondaryColor,
                                                )
                                              ],
                                            ),
                                            MaterialButton(
                                              disabledColor: secondaryColor
                                                  .withOpacity(0.3),
                                              color: isAccepted
                                                  ? secondaryColor
                                                  : greyColor,
                                              onPressed: isAccepted
                                                  ? () {
                                                      final box = GetStorage();
                                                      box.write(
                                                          'first', 'notfirst');
                                                      Get.offAll(HomeMenu());
                                                    }
                                                  : null,
                                              child: CustomText(
                                                text: 'accept'.tr,
                                                size: 14,
                                                textColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    );
                                  },
                                );
                              }),
                            );
                          });
                        }
                      },
                      color: languageController.language.value.isNotEmpty
                          ? secondaryColor
                          : greyColor,
                      padding: const EdgeInsets.all(kPadding15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'next'.tr,
                        style: TextStyle(color: whiteColor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
