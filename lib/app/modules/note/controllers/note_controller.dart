import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/models/note_model.dart';
import 'package:note_app/app/data/repository/repo.dart';

import '../../home/controllers/home_controller.dart';

class NoteController extends GetxController {
  late NoteModel note;

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    final selectedIndex = Get.find<HomeController>().selectedIndex;
    note = bankNotes[selectedIndex.value];
    titleController.text = note.title;
    descriptionController.text = note.description;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
