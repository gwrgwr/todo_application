import 'package:flutter/material.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/model/todo_model.dart';

class ModalEdit extends StatelessWidget {
  ModalEdit({required this.item, required this.todoBloc, super.key});

  final Todo item;
  final TodoBloc todoBloc;

  TextEditingController todoTextEdit = TextEditingController();
  TextEditingController descriptionTextEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Editar tarefa'),
              TextField(
                controller: todoTextEdit,
                decoration: InputDecoration(
                  label: const Text(
                    'Tarefa',
                    style: TextStyle(),
                  ),
                  hintText: item.todo,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              TextField(
                maxLines: null,
                controller: descriptionTextEdit,
                decoration: InputDecoration(
                  label: const Text(
                    'Descrição',
                    style: TextStyle(),
                  ),
                  hintText: item.description,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    todoBloc.add(
                      TodoUpdateEvent(
                        todo: Todo(
                          id: item.id,
                          todo: todoTextEdit.text.isEmpty
                              ? item.todo
                              : todoTextEdit.text,
                          description: descriptionTextEdit.text.isEmpty
                              ? item.todo
                              : descriptionTextEdit.text,
                          isdone: item.isdone,
                          datetime: item.datetime,
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      'Editar',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
