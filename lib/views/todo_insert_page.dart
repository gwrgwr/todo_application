import 'package:flutter/material.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/components/my_snackbar.dart';
import 'package:todo_application/model/todo_model.dart';
import 'package:uuid/uuid.dart';

class InsertPage extends StatelessWidget {
  InsertPage(this.todoBloc, {required this.pageController, super.key});
  final PageController pageController;
  final TodoBloc todoBloc;

  TextEditingController todoTextController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tarefa'),
          const SizedBox(height: 5),
          TextField(
            controller: todoTextController,
            decoration: InputDecoration(
              fillColor: const Color(0xff355486),
              filled: true,
              hintText: "Nome da tarefa",
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('Descrição'),
          const SizedBox(height: 5),
          TextField(
            maxLines: null,
            controller: descriptionController,
            decoration: InputDecoration(
              fillColor: const Color(0xff6A3586),
              filled: true,
              hintText: "Descrição da tarefa",
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              todoBloc.add(
                TodoInsertEvent(
                  todo: Todo(
                    id: const Uuid().v1(),
                    todo: todoTextController.text,
                    description: descriptionController.text,
                    isdone: 0,
                    datetime: DateTime.now().microsecondsSinceEpoch,
                  ),
                ),
              );
              todoTextController.clear();
              descriptionController.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                MySnackbar.mySnackbar(),
              );
              FocusManager.instance.primaryFocus?.unfocus();
              pageController.animateToPage(
                0,
                duration: Duration(seconds: 1),
                curve: Curves.ease,
              );
            },
            child: Container(
              child: const Text('Criar tarefa'),
            ),
          ),
        ],
      ),
    );
  }
}
