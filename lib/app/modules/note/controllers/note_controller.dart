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
    if (selectedIndex.value == -1) {
      note = NoteModel(title: '', description: '', date: DateTime.now());
    } else {
      note = bankNotes[selectedIndex.value];
      titleController.text = note.title;
      descriptionController.text = note.description;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addNote() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      note.title = titleController.text;
      note.description = descriptionController.text;
      note.date = DateTime.now();
      if (Get.find<HomeController>().selectedIndex.value == -1) {
        bankNotes.add(note);
      } else {
        bankNotes[Get.find<HomeController>().selectedIndex.value] = note;
      }
      Get.find<HomeController>().selectedIndex.value = -1;
      Get.back();
    }
  }
}
