// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final String todo;
  final String description;
  final bool isDone;
  Todo({
    required this.todo,
    required this.description,
    required this.isDone,
  });
  final DateTime data = DateTime.now();

  Todo copyWith({
    String? todo,
    String? description,
    bool? isDone,
  }) {
    return Todo(
      todo: todo ?? this.todo,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todo': todo,
      'description': description,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      todo: map['todo'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Todo(todo: $todo, description: $description, isDone: $isDone)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;
  
    return 
      other.todo == todo &&
      other.description == description &&
      other.isDone == isDone;
  }

  @override
  int get hashCode => todo.hashCode ^ description.hashCode ^ isDone.hashCode;
}
