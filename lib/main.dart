import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/data/data_from_sqflite.dart';
import 'package:todo_application/themes/dark_theme.dart';
import 'package:todo_application/views/page_view.dart';

import 'injections/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  getInjections();
  // final database = DataFromSqflite().deleteAllFromTable();
  // final database = DataFromSqflite().deleteTable();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: DarkTheme.darkTheme(),
      home: BlocProvider(
        create: (context) => TodoBloc(GetIt.instance.get<DataFromSqflite>()),
        child: MyPageView(),
      ),
    );
  }
}
