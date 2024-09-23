import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/app.dart';

import 'app/data/note_service.dart';

void main() async {
  await GetStorage.init();
  Get.put(
    NoteService(),
  );
  runApp(
    MyApp(),
  );
}
