import 'package:get/get.dart';

import '../models/note_model.dart';

final bankNotes = <NoteModel>[
  NoteModel(
      title: 'Note 1', description: 'Description 1', date: DateTime.now()),
  NoteModel(
      title: 'Note 2', description: 'Description 2', date: DateTime.now()),
].obs;
