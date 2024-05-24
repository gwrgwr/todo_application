import 'package:get_it/get_it.dart';

import '../data/data_from_sqflite.dart';
  getInjections() {
    GetIt.instance.registerSingleton<DataFromSqflite>(DataFromSqflite());
}