import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/bloc/todo_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoBloc = TodoBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<TodoBloc, TodoState>(
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

              if(state is TodoErrorState) {
                return Text(state.message);
              }

              return Container();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        todoBloc.add(TodoRetrieveAllEvent());
      },),
    );
  }
}
