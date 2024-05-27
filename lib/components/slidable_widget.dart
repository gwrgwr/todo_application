import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/components/modal_edit_widget.dart';
import 'package:todo_application/model/todo_model.dart';

class MySlidable extends StatelessWidget {
  const MySlidable(
      {required this.item,
      required this.todoBloc,
      required this.boolean,
      super.key});
  final Todo item;
  final TodoBloc todoBloc;
  final bool boolean;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 10),
          SlidableAction(
            autoClose: true,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            onPressed: (context) {
              todoBloc.add(TodoRemoveEvent(todo: item));
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
          const SizedBox(width: 20),
        ],
      ),
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          color: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Checkbox(
                value: boolean,
                onChanged: (value) {
                  value = boolean;
                }),
            SizedBox(
              width: 200,
              child: Text(
                textAlign: TextAlign.center,
                item.todo,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalEdit(
                      item: item,
                    );
                  },
                );
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
