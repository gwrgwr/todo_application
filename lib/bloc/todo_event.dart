part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}
class TodoUpdateEvent extends TodoEvent {}
class TodoInsertEvent extends TodoEvent {}
class TodoRemoveEvent extends TodoEvent{}
class TodoRetrieveAllEvent extends TodoEvent {}