import 'package:uuid/uuid.dart';

class NoteModel {
  String? id;
  String title;
  String description;
  DateTime date;

  NoteModel({
    String? id, // id является опциональным, если не указано - сгенерируется
    required this.title,
    required this.description,
    required this.date,
  }) : id = id ?? Uuid().v4();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']), // Преобразуем дату обратно
    );
  }
}
