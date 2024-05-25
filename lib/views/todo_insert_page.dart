import 'package:flutter/material.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/model/todo_model.dart';
import 'package:uuid/uuid.dart';

class InsertPage extends StatelessWidget {
  InsertPage(this.todoBloc, {super.key});

  final TodoBloc todoBloc;

  TextEditingController todoTextController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: todoTextController,
            decoration: InputDecoration(
              fillColor: Color(0xff355486),
              filled: true,
              hintText: "Task name",
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
          SizedBox(height: 10),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              fillColor: Color(0xff6A3586),
              filled: true,
              hintText: "Task name",
              hintStyle: TextStyle(
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
          SizedBox(height: 10),
          TextButton(
              onPressed: () {
                todoBloc.add(
                  TodoInsertEvent(
                    todo: Todo(
                      id: const Uuid().v1(),
                      todo: todoTextController.text,
                      description: descriptionController.text,
                      isdone: 0,
                      datetime: DateTime.now().microsecondsSinceEpoch
                    ),
                  ),
                );
              },
              child: Container(
                child: const Text('Criar tarefa'),
              ))
        ],
      ),
    );
  }
}
