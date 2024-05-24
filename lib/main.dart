import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/data/data_from_sqflite.dart';
import 'package:todo_application/views/home_page.dart';

import 'injections/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => TodoBloc(GetIt.instance.get<DataFromSqflite>()),
        child: const HomePage(),
      ),
    );
  }
}
