import 'package:flutter/material.dart';
import 'package:todo_application/controllers/todo_states.dart';
import 'package:todo_application/data/data_from_file.dart';

class TodoStore extends ValueNotifier<TodoStates> {
  TodoStore() : super(TodoInitialState());

  Future getDataFromFile() async {
    final dataFromFile = DataFromFile();
    value = TodoLoadingState();
    try {
      final todoList = await dataFromFile.openRead();
      value = TodoSuccessState(todoList: todoList);
    } catch (e) {
      value = TodoErrorState(message: e.toString());
    }
  }
}