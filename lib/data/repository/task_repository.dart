import 'package:list_test/data/model/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository {
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB();
    return _database;
  }

  Future<int> addNewTask(Task task) async {
    final db = await database;
    return db!.insert(Task.table, task.toMap());
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db!.update(Task.table, task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final rawTasks = await db!.rawQuery('SELECT * FROM ${Task.table}');
    return rawTasks.asMap().entries.map((e) => Task.fromMap(e.value)).toList();
  }

  Future<Database> _initDB() async {
    final databasessDirectory = await getDatabasesPath();
    final path = join(databasessDirectory, 'tasks.db');
    return openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE Task (id TEXT PRIMARY KEY, text TEXT, isDone INTEGER)');
      },
    );
  }
}
