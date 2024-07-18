import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/app_model.dart';
import '../services/api_repo.dart';
import '../utils/constants.dart';

class AppConfigController extends GetxController {
  final isLoading = false.obs;
  Rx<AppModel> appModel = AppModel().obs;

  @override
  void onInit() {
    getAppConfig();
    super.onInit();
  }

  Future<void> getAppConfig() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getAppConfig();
      appModel.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
