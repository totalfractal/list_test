import 'package:list_test/data/model/task.dart';
import 'package:list_test/data/repository/task_repository.dart';

class TaskInteractor {
  static final TaskRepository _repo = TaskRepository();
  static Future<List<Task>> getTasks() async  => await _repo.getTasks();
  static Future<int> addTask(Task task) async => await _repo.addNewTask(task);
  static Future<int> updateTask(Task task) async => await _repo.updateTask(task);

}
