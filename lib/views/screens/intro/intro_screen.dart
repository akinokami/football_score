import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/change_language.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';
import '../../../controller/intro_screen_controller.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/global.dart';
import '../../widgets/custom_text.dart';
import '../home._menu.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
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
    // TODO: implement initState
    super.initState();
    final box = GetStorage();
    first = box.read('first') ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (first == '') {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => Builder(builder: (context) {
            return StatefulBuilder(
              builder: (context, StateSetter setState) {
                return AlertDialog(
                  title: CustomText(
                    text: 'Privacy Policy',
                    fontWeight: FontWeight.w500,
                  ),
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Text(Global.policy, style: TextStyle(fontSize: 12)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              activeColor: Colors.green,
                              side: BorderSide(
                                width: 1.5,
                                color: isChecked ? Colors.green : Colors.black,
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
                              text: 'I agreed to the Privacy Policy.',
                              size: 12,
                            )
                          ],
                        ),
                        MaterialButton(
                          disabledColor: secondaryColor.withOpacity(0.3),
                          color: isAccepted ? secondaryColor : greyColor,
                          child: CustomText(
                            text: 'Accept',
                            size: 14,
                            textColor: Colors.white,
                          ),
                          onPressed: isAccepted
                              ? () {
                                  final box = GetStorage();
                                  box.write('first', 'notfirst');
                                  Navigator.pop(context);
                                }
                              : null,
                        ),
                      ],
                    )),
                  ),
                );
              },
            );
          }),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final introController = Get.put(IntroScreenController());
    final appConfigController = Get.put(AppConfigController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: whiteColor),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(ChangeLanguageScreen());
              },
              child: Row(
                children: [
                  CustomText(text: "English", size: 16, textColor: whiteColor),
                  Icon(
                    Icons.language,
                    color: whiteColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: primaryColor),
          child: Padding(
            padding: const EdgeInsets.all(kPadding15),
            child: ListView(
              children: [
                Text(
                  LocaleKeys.kLeagueChoice.tr(),
                  style: TextStyle(color: whiteColor, fontSize: 30),
                ),
                kSizedBoxH20,
                Text(
                  LocaleKeys.kYouCanChooseMultiple.tr(),
                  style: TextStyle(color: greyColor, fontSize: 20),
                ),
                kSizedBoxH20,
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: introController.sportIconList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: kPadding10,
                            crossAxisSpacing: kPadding10,
                            childAspectRatio: 1.5,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Obx(() => GestureDetector(
                            onTap: () {
                              introController.selectSport(index);
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: introController.selectedSportIndex
                                          .contains(index)
                                      ? secondaryColor
                                      : greyColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                Obx(
                  () => MaterialButton(
                    onPressed: () {
                      if (introController.selectedSportIndex.isNotEmpty) {
                        Get.to(HomeMenu());
                      }
                    },
                    color: introController.selectedSportIndex.isNotEmpty
                        ? secondaryColor
                        : cardColor,
                    padding: const EdgeInsets.all(kPadding15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Next",
                      style: TextStyle(color: whiteColor, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
