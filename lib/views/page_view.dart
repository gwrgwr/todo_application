import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/views/home_page.dart';
import 'package:todo_application/views/todo_insert_page.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff030034),
            Color(0xff090979),
            Color(0xff127387),
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          children: [
            HomePage(),
            InsertPage(GetIt.instance.get<TodoBloc>()),
          ],
        ),
      ),
    );
  }
}