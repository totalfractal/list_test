import 'package:uuid/uuid.dart';

class Task {
  static const table = 'Task';

  final String id;
  final String text;
  bool isDone;
  Task._({required this.id, required this.text, required this.isDone});

  @override
  String toString() {
    return text;
  }

  factory Task.fromScratch({
    required String id,
    required String text,
    required bool isDone,
  }) =>
      Task._(id: id, text: text, isDone: isDone);

  factory Task.fromMap(Map<String, dynamic> map) => Task._(id: map['id'] as String, text: map['text'] as String, isDone: map['isDone'] == 1);

  Map<String, dynamic> toMap() => {'id': id.toString(), 'text': text, 'isDone': isDone ? 1 : 0};
}
