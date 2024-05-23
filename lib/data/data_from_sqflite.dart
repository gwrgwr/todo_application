import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_application/model/todo_model.dart';

class DataFromSqflite {
  Future<Database> getDatabase() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE TODO(id INTEGER PRIMAY KEY, todo TEXT NOT NULL, description TEXT NOT NULL, isDone BOOL)");
      },
      version: 1,
    );
    return database;
  }

  Future<List<Map<String, Object?>>> retrieverAll() async {
    final database = await getDatabase();
    print("Meu retrieve: ${await database.query('TODO')}");
    return await database.query('TODO');
  }

  Future deleteTuple(int userId) async {
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
    print("Meu insert: ${await database.insert('TODO', todo.toMap())}");
  }
}
