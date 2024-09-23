import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/drawer_menu.dart';
import '../../widgets/note_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: Theme.of(context).colorScheme.secondaryContainer,
      type: SideMenuType.slideNRotate,
      key: controller.sideMenuKey,
      menu: DrawerMenu(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Obx(
          () => ListView.builder(
              itemCount: controller.bankNotes.length,
              itemBuilder: (
                context,
                index,
              ) {
                return NoteCard(
                    index: controller.bankNotes.length - 1 - index,
                    onTap: () {
                      controller.selectedIndex.value =
                          controller.bankNotes.length - 1 - index;
                      Get.toNamed(Routes.NOTE);
                    });
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.selectedIndex.value = -1;
            Get.toNamed(Routes.NOTE);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'My Notes',
        style: TextStyle(
            color: Get.theme.colorScheme.primary,
            fontSize: 24.0,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          if (controller.isOpened.value) {
            controller.sideMenuKey.currentState!.closeSideMenu();
          } else {
            controller.sideMenuKey.currentState!.openSideMenu();
          }
        },
      ),
    );
  }
}
