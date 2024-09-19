import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../material_theme.dart';

class SettingsController extends GetxController {
  final materialTheme = MaterialTheme(TextTheme());
  final isDarkMode = Get.isDarkMode.obs;

  void changeTheme() {
    Get.changeTheme(
        Get.isDarkMode ? materialTheme.light() : materialTheme.dark());
    isDarkMode.value = !isDarkMode.value;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
