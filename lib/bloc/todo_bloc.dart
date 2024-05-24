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
      final retrieve = await _dataFromSqflite.retrieveAll();
      final update = await _dataFromSqflite.updateData(event.todo);
      retrieve[retrieve.indexWhere((element) => element == update)] = update;
      emit(TodoSuccessState(listTodo: retrieve));
    });

    on<TodoInsertEvent>((event, emit) async {
      final retrieve = await _dataFromSqflite.retrieveAll();
      final insert = await _dataFromSqflite.insertData(event.todo);
      retrieve.add(insert);
      emit(TodoSuccessState(listTodo: retrieve));
    });

    on<TodoRemoveEvent>((event, emit) async {
      final retrieve = await _dataFromSqflite.retrieveAll();
      final remove = await _dataFromSqflite.deleteTuple(event.todo.id);
      retrieve.removeWhere((element) => element.id == remove);
      emit(TodoSuccessState(listTodo: retrieve));
    });
  }
}
