import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/note_model.dart';
import '../controllers/note_controller.dart';

class NoteView extends GetView<NoteController> {
  NoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteView'),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                hintText: "Заголовок", // Подсказка для пользователя
                border: OutlineInputBorder(), // Граница вокруг поля ввода
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: controller.descriptionController,
              maxLines: null, // Поле будет расти по мере ввода
              minLines: 10, // Минимум 5 строк будет видно сразу
              keyboardType:
                  TextInputType.multiline, // Включает многострочный ввод
              textInputAction:
                  TextInputAction.newline, // Позволяет вставлять новые строки
              decoration: InputDecoration(
                hintText: "Введите описание", // Подсказка для пользователя
                border: OutlineInputBorder(), // Граница вокруг поля ввода
              ),
            ),
          ],
        ),
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addNote();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
