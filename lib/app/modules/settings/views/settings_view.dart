import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(
              color: Get.theme.colorScheme.primary,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Divider(
              color: Get.theme.colorScheme.primary,
            ),
            ListTile(
              leading: Icon(Icons.brightness_4,
                  color: Get.theme.colorScheme.secondary),
              title: const Text('Theme'),
              subtitle: const Text('Change app theme'),
              trailing: Obx(() => Switch(
                    value: controller.isDarkMode.value,
                    onChanged: (value) {
                      controller.changeTheme();
                    },
                  )),
            ),
            Divider(
              color: Get.theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
