import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_application/model/todo_model.dart';

class DataFromSqflite {
  Future<Database> getDatabase() async {
    final path = await getDatabasesPath();
    final database = await openDatabase(
      join(path, 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE TODO(
            id TEXT PRIMARY KEY,
            todo TEXT NOT NULL,
            description TEXT NOT NULL,
            isdone INTEGER NOT NULL,
            datetime INTEGER NOT NULL)
          ''');
      },
      version: 1,
    );
    return database;
  }

  Future<List<Todo>> retrieveAll() async {
    final database = await getDatabase();
    final data = await database.query('TODO');
    return data.map((map) => Todo.fromMap(map)).toList();
  }

  Future deleteTuple(String userId) async {
    final database = await getDatabase();
    database.delete('TODO', where: 'id = ?', whereArgs: [userId]);
  }

  Future updateData(Todo todo) async {
    final database = await getDatabase();
    database.update('TODO', todo.toMap());
  }

  Future insertData(Todo todo) async {
    final database = await getDatabase();
    await database.insert('TODO', todo.toMap());
  }

  Future deleteAllFromTable() async {
    final database = await getDatabase();
    await database.rawDelete("DELETE FROM TODO");
  }

  Future deleteTable() async {
    final database = await getDatabase();
    await database.rawDelete("DELETE TABLE TODO");
  }
}
