import 'package:flutter/material.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/views/screens/settings/settings_screen.dart';
import 'package:get/get.dart';
import 'package:football_score/controller/home_controller.dart';
import 'package:football_score/views/screens/matches/match_screen.dart';
import 'package:football_score/views/screens/news/news_screen.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: primaryColor,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: secondaryColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.sports_outlined,
                    size: 20.0,
                  ),
                ),
                label: 'matches'.tr,
                backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.menu_book,
                    size: 20.0,
                  ),
                ),
                label: 'news'.tr,
                backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'settings'.tr,
                backgroundColor: primaryColor,
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put(HomeController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, homeController),
      body: Obx(() => IndexedStack(
            index: homeController.tabIndex.value,
            children: const [MatchScreen(), NewsScreen(), SettingsScreen()],
          )),
    ));
  }
}
