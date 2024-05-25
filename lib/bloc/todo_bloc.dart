import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_application/data/data_from_sqflite.dart';
import 'package:todo_application/model/todo_model.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DataFromSqflite _dataFromSqflite;

  TodoBloc(this._dataFromSqflite) : super(TodoInitialState()) {
    on<TodoRetrieveAllEvent>((TodoRetrieveAllEvent event, Emitter emit) async {
      final retrieve = await _dataFromSqflite.retrieveAll();
      emit(TodoSuccessState(listTodo: retrieve));
    });

    on<TodoUpdateEvent>((event, emit) async {
      await _dataFromSqflite.updateData(event.todo);
      add(TodoRetrieveAllEvent());
    });

    on<TodoInsertEvent>((event, emit) async {
      await _dataFromSqflite.insertData(event.todo);
      add(TodoRetrieveAllEvent());
    });

    on<TodoRemoveEvent>((event, emit) async {
      await _dataFromSqflite.deleteTuple(event.todo.id);
      add(TodoRetrieveAllEvent());
    });
  }
}
