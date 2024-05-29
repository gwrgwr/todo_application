import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/components/bottom_sheets_edit.dart';
import 'package:todo_application/model/todo_model.dart';

class MySlidable extends StatelessWidget {
  const MySlidable({
    required this.item,
    required this.todoBloc,
    required this.boolean,
    super.key,
  });
  final Todo item;
  final TodoBloc todoBloc;
  final bool boolean;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Theme.of(context).colorScheme.background;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              autoClose: true,
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                todoBloc.add(TodoRemoveEvent(todo: item));
              },
              icon: Icons.delete,
            ),
          ],
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Column(
                        children: [
                          Text(item.id),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Fechar',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        value: boolean,
                        onChanged: (value) {
                          todoBloc.add(
                            TodoUpdateEvent(
                              todo: Todo(
                                id: item.id,
                                todo: item.todo,
                                description: item.description,
                                isdone: value == false ? 0 : 1,
                                datetime: item.datetime,
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      textAlign: TextAlign.center,
                      item.todo,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return ModalEdit(
                            item: item,
                            todoBloc: todoBloc,
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 25,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
