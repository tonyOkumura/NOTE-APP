import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:note_app/app/data/repository/repo.dart';
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
        body: ListView.builder(
            itemCount: bankNotes.length,
            itemBuilder: (
              context,
              index,
            ) {
              return NoteCard(
                  index: index,
                  onTap: () {
                    controller.selectedIndex.value = index;
                    Get.toNamed(Routes.NOTE);
                  });
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
