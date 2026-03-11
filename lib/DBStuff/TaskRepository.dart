
import 'package:drift/drift.dart';
import 'package:task_manager_app/DBStuff/database.dart';
import 'package:task_manager_app/Task.dart';


class TaskRepository {
  final AppDatabase db;

  TaskRepository(this.db);

  void addTask(TaskModel task) {
    db.addTask(TasksCompanion.insert(

      taskName: task.taskName,
      description: task.description,
      isComplete: Value(task.isComplete),
      isFavorite: Value(task.isFavorite),

    ));
  }

  void toggleFavorite(Task task) {
    db.updateTask(task.copyWith(isFavorite: !task.isFavorite));
  }

  void completeTask(Task task){
    db.updateTask(task.copyWith(isComplete: true));
  }

  void unCompleteTask(Task task){
    db.updateTask(task.copyWith(isComplete: false));
  }

  void deleteTask(Task task) {
    db.deleteTask(task);
  }

  Stream<List<Task>> watchAllTasks() => db.watchAllTasks();
}