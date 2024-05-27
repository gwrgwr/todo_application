import 'package:flutter/material.dart';
import 'package:todo_application/model/todo_model.dart';

class ModalEdit extends StatelessWidget {
  ModalEdit({required this.item, super.key});

  final Todo item;

  TextEditingController todoTextEdit = TextEditingController();
  TextEditingController descriptionTextEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: todoTextEdit,
              decoration: InputDecoration(
                label: const Text(
                  'Tarefa',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                hintText: item.todo,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: null,
              controller: descriptionTextEdit,
              decoration: InputDecoration(
                label: const Text(
                  'Descrição',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                hintText: item.description,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
