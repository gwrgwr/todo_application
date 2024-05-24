// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final int id;
  final String todo;
  final String description;
  final bool isDone;
  Todo({
    required this.id,
    required this.todo,
    required this.description,
    required this.isDone,
  });

  Todo copyWith({
    int? id,
    String? todo,
    String? description,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'todo': todo,
      'description': description,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      todo: map['todo'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as int == 0 ? false : true,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo(id: $id, todo: $todo, description: $description, isDone: $isDone)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.todo == todo &&
      other.description == description &&
      other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      todo.hashCode ^
      description.hashCode ^
      isDone.hashCode;
  }
}
