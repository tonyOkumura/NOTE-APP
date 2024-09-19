import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: Theme.of(context).colorScheme.tertiaryContainer,
      type: SideMenuType.slideNRotate,
      key: controller.sideMenuKey,
      menu: buildMenu(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              if (controller.isOpened.value) {
                controller.sideMenuKey.currentState!.closeSideMenu();
              }
              // close side menu
              else {
                controller.sideMenuKey.currentState!.openSideMenu();
              } // open side menu
            },
          ),
        ),
        body: const Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

Widget buildMenu() {
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
                backgroundColor: Get.theme.colorScheme.onTertiaryContainer,
                radius: 22.0,
              ),
              const SizedBox(height: 16.0),
              Text(
                "Hello, John Doe",
                style:
                    TextStyle(color: Get.theme.colorScheme.onTertiaryContainer),
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
            color: Get.theme.colorScheme.onTertiaryContainer,
          ),
          title: Text(
            "Home",
            style: TextStyle(color: Get.theme.colorScheme.onTertiaryContainer),
          ),
          dense: true,
        ),
        ListTile(
          onTap: () {
            Get.toNamed('/settings');
          },
          leading: Icon(Icons.settings,
              size: 20.0, color: Get.theme.colorScheme.onTertiaryContainer),
          title: Text(
            "Settings",
            style: TextStyle(color: Get.theme.colorScheme.onTertiaryContainer),
          ),

          dense: true,

          // padding: EdgeInsets.zero,
        ),
      ],
    ),
  );
}
