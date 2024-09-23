import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../../data/models/note_model.dart';
import '../../../data/note_service.dart';

class HomeController extends GetxController {
  final isOpened = false.obs;
  final selectedIndex = 0.obs;

  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  var bankNotes = <NoteModel>[].obs;
  final NoteService _noteService = NoteService();
  @override
  void onInit() {
    super.onInit();
    loadNotes(); // Загружаем заметки при инициализации
  }

  // Загрузка заметок из сервиса
  void loadNotes() {
    bankNotes.addAll(_noteService.loadNotes());
  }

  // Сохранение изменений
  void saveNotes() {
    _noteService.saveNotes(bankNotes);
  }
}
