import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/views/home_page.dart';
import 'package:todo_application/views/todo_insert_page.dart';

class MyPageView extends StatelessWidget {
  MyPageView({super.key});

  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('teste'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).buttonTheme.colorScheme?.primary,
            ),
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          const HomePage(),
          InsertPage(
            GetIt.instance.get<TodoBloc>(),
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}

// Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xff030034),
//             Color(0xff090979),
//             Color(0xff127387),
//         ])
//       ),
//       child: 