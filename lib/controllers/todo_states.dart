import '../model/todo_model.dart';

abstract class TodoStates {}

class TodoInitialState extends TodoStates {}
class TodoLoadingState extends TodoStates {}
class TodoSuccessState extends TodoStates {
  final List<Todo> todoList;

  TodoSuccessState({required this.todoList});
}
class TodoErrorState extends TodoStates {
  final String message;

  TodoErrorState({required this.message});
}