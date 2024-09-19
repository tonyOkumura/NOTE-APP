import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Темы'),
              subtitle: const Text('Смените тему приложения'),
              trailing: Obx(() => Switch(
                    value: controller.isDarkMode.value,
                    onChanged: (value) {
                      controller.changeTheme();
                    },
                  )),
            ),
            // const Divider(),
            // ListTile(
            //   title: const Text('Уведомления'),
            //   subtitle: const Text('Настройка уведомлений'),
            //   trailing: const Icon(Icons.arrow_forward_ios),
            //   onTap: () {
            //     // Логика для перехода к настройкам уведомлений
            //   },
            // ),
            // const Divider(),
            // ListTile(
            //   title: const Text('О приложении'),
            //   subtitle: const Text('Информация о приложении'),
            //   trailing: const Icon(Icons.arrow_forward_ios),
            //   onTap: () {
            //     // Логика для перехода к информации о приложении
            //   },
            // ),
            // const Divider(),
            // ListTile(
            //   title: const Text('Профиль'),
            //   subtitle: const Text('Управление профилем'),
            //   trailing: const Icon(Icons.arrow_forward_ios),
            //   onTap: () {
            //     // Логика для перехода к настройкам профиля
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
