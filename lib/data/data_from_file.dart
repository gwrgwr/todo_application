import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:todo_application/controllers/todo_store.dart';

import '../model/todo_model.dart';

class DataFromFile {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return await File('$path/data.txt').create();
  }

  Future<File> writeData({required List<Todo> todoList}) async {
    final file = await _localFile;
    final jsonString = jsonEncode(todoList);
    return file.writeAsString(jsonString);
  }

  Future<List<Todo>> readData() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      List<dynamic> jsonData = jsonDecode(contents);
      return jsonData.map((item) => Todo.fromJson(item)).toList();
    } catch (e) {
      // If encountering an error, return 0
      return [];
    }
  }

  Future deleteFile() async {
    final file = await _localFile;
    await file.delete();
  }

  Future<bool> fileExists() async {
    final path = await _localPath;
    return await File('$path/data.txt').exists();
  }

  Future openRead() async {
    final file = await _localFile;
    Stream<List<int>> inputStream = file.openRead();
    String contents = await inputStream.transform(utf8.decoder).transform(const LineSplitter()).join('\n');
    List<dynamic> jsonList = jsonDecode(contents);
    List<Todo> todoList = jsonList.map((item) => Todo.fromJson(item)).toList();
    return todoList;
  }

  Future isModified() async {
    final file = await _localFile;
    file.watch().listen((event) async {
      if(event.type == FileSystemEvent.modify) {
        return await openRead();
      }
    });
  }
}
