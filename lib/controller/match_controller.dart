import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/services/api_repo.dart';
import 'package:football_score/utils/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class MatchController extends GetxController {
  final selectedIndex = 0.obs;
  final isLoading = false.obs;
  Rx<MatchModel> matchModel = MatchModel().obs;
  RxList<Matches> matchList = <Matches>[].obs;
  RxList<Matches> matchSearchList = <Matches>[].obs;
  TextEditingController searchController = TextEditingController();
  var selectedDate = DateTime.now().obs;
  DatePickerController datePickerController = DatePickerController();
  var selectedUrl = ''.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollToSelectedDate();
    });
    startMatch();
    // print("date>>>>>>${DateTime.now()}");
    // print("date utc>>>>>>${DateTime.now().toUtc()}");

    super.onInit();
  }

  void searchMatches() {
    if (searchController.text.isNotEmpty) {
      matchSearchList.value = matchList
          .where((element) =>
              element.teamAName!
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) ||
              element.teamBName!
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
          .toList();
    }
  }

  void startMatch() {
    if (Get.find<AppConfigController>().mTabList.isNotEmpty) {
      getMatches(Get.find<AppConfigController>().mTabList[0].api ?? '');
    }
    selectedIndex.value = 0;
  }

  void changeIndex(int index, String url) {
    selectedIndex.value = index;
    getMatches(url);
  }

  Future<void> getMatches(String url) async {
    isLoading.value = true;
    try {
      selectedUrl.value = url;
      final result = await ApiRepo()
          .getMatches(url: url, date: selectedDate.value.toString());
      matchModel.value = result;

      if (matchModel.value.list != null) {
        matchList.value = matchModel.value.list!.where((element) {
          return DateFormat('yyyy-MM-dd').format(
                  DateTime.parse(element.startPlay ?? '')
                      .add(const Duration(hours: 8))) ==
              DateFormat('yyyy-MM-dd').format(selectedDate.value);
        }).toList();
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void scrollToSelectedDate() {
    datePickerController.animateToDate(selectedDate.value);
  }

  String convertUtcToLocal(String utcTimeString) {
    // Parse UTC time string into DateTime object
    DateTime utcTime = DateTime.parse(utcTimeString).toUtc();

    String localTimeZone = tz.local.name;
    // Get local time zone
    tz.Location? location = tz.getLocation(localTimeZone);

    // Convert UTC time to local time
    tz.TZDateTime localTime = tz.TZDateTime.from(utcTime, location);

    // Format local time as a string (adjust format as needed)
    String formattedLocalTime = localTime.toString();

    return formattedLocalTime;
  }
}
