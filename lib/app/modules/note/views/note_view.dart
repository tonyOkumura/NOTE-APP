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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [
          TextField(
            controller: controller.titleController,
          ),
          TextField(
            controller: controller.descriptionController,
          ),
        ],
      ))),
    );
  }
}
