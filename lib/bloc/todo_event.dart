part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}
class TodoUpdateEvent extends TodoEvent {
  final Todo todo;

  TodoUpdateEvent({required this.todo});
}
class TodoInsertEvent extends TodoEvent {
  final Todo todo;

  TodoInsertEvent({required this.todo});
}
class TodoRemoveEvent extends TodoEvent{
  final Todo todo;

  TodoRemoveEvent({required this.todo});
}
class TodoRetrieveAllEvent extends TodoEvent {}