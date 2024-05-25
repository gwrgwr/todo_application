import 'package:get_it/get_it.dart';
import 'package:todo_application/bloc/todo_bloc.dart';

import '../data/data_from_sqflite.dart';
  getInjections() {
    GetIt.instance.registerSingleton<DataFromSqflite>(DataFromSqflite());
    GetIt.instance.registerSingleton<TodoBloc>(TodoBloc(GetIt.instance.get<DataFromSqflite>()));
}