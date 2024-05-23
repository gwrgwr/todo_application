import 'package:flutter/material.dart';
import 'package:todo_application/controllers/todo_states.dart';
import 'package:todo_application/controllers/todo_store.dart';
import 'package:todo_application/data/data_from_file.dart';

import '../model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TodoStore();
  final dataFromFile = DataFromFile();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await controller.getDataFromFile();
      await dataFromFile.isModified();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, state, child) {
              if (state is TodoLoadingState) {
                return const CircularProgressIndicator();
              }

              if (state is TodoErrorState) {
                return Text("Meu erro: ${state.message}");
              }

              if (state is TodoSuccessState) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.todoList.length,
                  itemBuilder: (context, index) {
                    final item = state.todoList[index];
                    return Text(item.todo);
                  },
                );
              }

              return Container();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<Todo> testes = [
            Todo(todo: 'teste1', description: 'testando1', isDone: false),
            Todo(todo: 'teste2', description: 'testando2', isDone: false),
            Todo(todo: 'teste3', description: 'testando3', isDone: false),
            Todo(todo: 'teste4', description: 'testando4', isDone: false),
          ];
          final list = await dataFromFile.readData();
          await dataFromFile.writeData(todoList: [...list, testes[1]]);
          await controller.getDataFromFile();
        },
      ),
    );
  }
}
