import 'package:get_storage/get_storage.dart';
import 'package:note_app/app/data/models/note_model.dart';

class NoteService {
  final GetStorage _storage = GetStorage();
  final String _notesKey = 'notes'; // Ключ для хранения заметок

  // Загрузка заметок из хранилища
  List<NoteModel> loadNotes() {
    List<dynamic>? storedNotes = _storage.read<List>(_notesKey);
    if (storedNotes != null) {
      return storedNotes.map((json) => NoteModel.fromJson(json)).toList();
    }
    return [];
  }

  // Сохранение заметок в хранилище
  void saveNotes(List<NoteModel> notes) {
    List<Map<String, dynamic>> noteList =
        notes.map((note) => note.toJson()).toList();
    _storage.write(_notesKey, noteList); // Записываем в локальное хранилище
  }

  // Добавление новой заметки
  void addNote(NoteModel note) {
    List<NoteModel> notes = loadNotes();
    notes.add(note);
    saveNotes(notes); // Сохраняем обновленный список заметок
  }

  // Обновление существующей заметки
  void updateNote(int index, NoteModel note) {
    List<NoteModel> notes = loadNotes();
    if (index >= 0 && index < notes.length) {
      notes[index] = note;
      saveNotes(notes); // Сохраняем обновленный список
    }
  }

  // Удаление заметки
  void deleteNote(int index) {
    List<NoteModel> notes = loadNotes();
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      saveNotes(notes); // Сохраняем обновленный список
    }
  }
}
