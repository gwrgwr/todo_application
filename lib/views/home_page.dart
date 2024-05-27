import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/components/modal_edit_widget.dart';
import 'package:todo_application/components/slidable_widget.dart';
import 'package:todo_application/data/data_from_sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TodoBloc todoBloc;

  @override
  void initState() {
    super.initState();
    todoBloc = TodoBloc(GetIt.instance.get<DataFromSqflite>());
    todoBloc.add(TodoRetrieveAllEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      bloc: todoBloc,
      builder: (context, state) {
        if (state is TodoLoadingState) {
          return const CircularProgressIndicator();
        }

        if (state is TodoSuccessState) {
          if (state.listTodo.isEmpty) {
            return Center(
              child: Text(
                'Não há tarefas para serem feitas',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return Column(
            children: [
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                shrinkWrap: true,
                itemCount: state.listTodo.length,
                itemBuilder: (context, index) {
                  final item = state.listTodo[index];
                  final boolean = item.isdone == 0 ? false : true;
                  return MySlidable(
                    todoBloc: todoBloc,
                    item: item,
                    boolean: boolean,
                  );
                },
              ),
            ],
          );
        }

        if (state is TodoErrorState) {
          return Text(state.message);
        }

        return Container();
      },
    );
  }
}
