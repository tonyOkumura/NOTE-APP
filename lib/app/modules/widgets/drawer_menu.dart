import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/controllers/home_controller.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Get.theme.colorScheme.onSecondaryContainer,
                  radius: 22.0,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Hello, John Doe",
                  style: TextStyle(
                      color: Get.theme.colorScheme.onSecondaryContainer),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              final controller = Get.find<HomeController>();
              controller.sideMenuKey.currentState!.closeSideMenu();
            },
            leading: Icon(
              Icons.home,
              size: 20.0,
              color: Get.theme.colorScheme.onSecondaryContainer,
            ),
            title: Text(
              "Home",
              style:
                  TextStyle(color: Get.theme.colorScheme.onSecondaryContainer),
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Get.toNamed('/settings');
            },
            leading: Icon(Icons.settings,
                size: 20.0, color: Get.theme.colorScheme.onSecondaryContainer),
            title: Text(
              "Settings",
              style:
                  TextStyle(color: Get.theme.colorScheme.onSecondaryContainer),
            ),

            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
