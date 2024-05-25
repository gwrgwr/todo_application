// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Todo {
  final String id;
  final String todo;
  final String description;
  final int isdone;
  final int datetime;
  Todo({
    required this.id,
    required this.todo,
    required this.description,
    required this.isdone,
    required this.datetime,
  });

  Todo copyWith({
    String? id,
    String? todo,
    String? description,
    int? isdone,
    int? datetime,
  }) {
    return Todo(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      description: description ?? this.description,
      isdone: isdone ?? this.isdone,
      datetime: datetime ?? this.datetime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'todo': todo,
      'description': description,
      'isdone': isdone,
      'datetime': datetime,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      todo: map['todo'] as String,
      description: map['description'] as String,
      isdone: map['isdone'] as int,
      datetime: map['datetime'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo(id: $id, todo: $todo, description: $description, isdone: $isdone, datetime: $datetime)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.todo == todo &&
      other.description == description &&
      other.isdone == isdone &&
      other.datetime == datetime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      todo.hashCode ^
      description.hashCode ^
      isdone.hashCode ^
      datetime.hashCode;
  }
}
