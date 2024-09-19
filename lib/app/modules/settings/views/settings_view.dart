import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../material_theme.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({super.key});
  final materialTheme = MaterialTheme(TextTheme());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
            onPressed: () {
              Get.changeTheme(Get.isDarkMode
                  ? materialTheme.light()
                  : materialTheme.dark());
            },
            child: const Text('Switch Theme')),
      ),
    );
  }
}
