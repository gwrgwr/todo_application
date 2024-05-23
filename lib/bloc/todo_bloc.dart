import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_application/data/data_from_sqflite.dart';
import 'package:todo_application/model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final _dataFromSqflite = DataFromSqflite();

  TodoBloc() : super(TodoInitialState()) {

    on<TodoRetrieveAllEvent>((TodoRetrieveAllEvent event, Emitter emit) async {
      final todo = Todo(id: 1, todo: '123', description: 'asdasd', isDone: false);
      final insert = await _dataFromSqflite.insertData(todo);
      final retrieve = await _dataFromSqflite.retrieverAll();
      final List<Todo> listTodo = [];
      for (var element in retrieve) {
        
      }
      emit(TodoSuccessState(listTodo: listTodo));
    });
  }
}
