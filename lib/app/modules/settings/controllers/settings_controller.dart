// ignore_for_file: prefer_const_constructors

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
}
