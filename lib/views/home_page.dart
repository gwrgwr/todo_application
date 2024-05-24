import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('teste'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<TodoBloc, TodoState>(
            bloc: todoBloc,
            builder: (context, state) {
              if (state is TodoLoadingState) {
                return const CircularProgressIndicator();
              }

              if (state is TodoSuccessState) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.listTodo.length,
                    itemBuilder: (context, index) {
                      final item = state.listTodo[index];
                      return Text(item.description);
                    },
                  ),
                );
              }

              if (state is TodoErrorState) {
                return Text(state.message);
              }

              return Container();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoBloc.add(TodoRetrieveAllEvent());
        },
      ),
    );
  }
}
