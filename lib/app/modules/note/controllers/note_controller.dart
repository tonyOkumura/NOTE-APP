import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/models/note_model.dart';
import '../../../data/note_service.dart';
import '../../home/controllers/home_controller.dart';

class NoteController extends GetxController {
  late NoteModel note;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final NoteService _noteService =
      NoteService(); // Используем сервис для операций с заметками

  @override
  void onInit() {
    super.onInit();
    final selectedIndex = Get.find<HomeController>().selectedIndex;
    if (selectedIndex.value == -1) {
      note = NoteModel(title: '', description: '', date: DateTime.now());
    } else {
      note = Get.find<HomeController>().bankNotes[selectedIndex.value];
      titleController.text = note.title;
      descriptionController.text = note.description;
    }
  }

  // Добавление новой заметки
  void addNote() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      note.title = titleController.text;
      note.description = descriptionController.text;
      note.date = DateTime.now();

      if (Get.find<HomeController>().selectedIndex.value == -1) {
        Get.find<HomeController>()
            .bankNotes
            .add(note); // Добавляем заметку в список
        _noteService.addNote(note); // Добавляем заметку в хранилище
      } else {
        int index = Get.find<HomeController>().selectedIndex.value;
        Get.find<HomeController>().bankNotes[index] =
            note; // Обновляем заметку в списке
        _noteService.updateNote(index, note); // Обновляем заметку в хранилище
      }

      Get.find<HomeController>().selectedIndex.value = -1;
      Get.back();
    }
  }

  // Удаление заметки
  void deleteNote() {
    int index = Get.find<HomeController>().selectedIndex.value;
    if (index != -1) {
      Get.find<HomeController>()
          .bankNotes
          .removeAt(index); // Удаляем заметку из списка
      _noteService.deleteNote(index); // Удаляем заметку из хранилища
      Get.find<HomeController>().selectedIndex.value = -1;
      Get.back();
    }
  }
}
