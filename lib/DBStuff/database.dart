import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

// This mirrors your Task class but as a Drift table
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get taskName => text()();
  TextColumn get description => text()();
  BoolColumn get isComplete => boolean().withDefault(const Constant(false))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Get all tasks once
  Future<List<Task>> getAllTasks() => select(tasks).get();

  // Watch all tasks live
  Stream<List<Task>> watchAllTasks() => select(tasks).watch();

  // Watch favorites only
  Stream<List<Task>> watchFavoriteTasks() =>
      (select(tasks)..where((t) => t.isFavorite.equals(true))).watch();

  // Add a task
  Future<void> addTask(TasksCompanion task) => into(tasks).insert(task);

  // Update a task (for toggling favorite, complete etc)
  Future<void> updateTask(Task task) => update(tasks).replace(task);

  // Delete a task
  Future<void> deleteTask(Task task) => delete(tasks).delete(task);
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'fluttasks_database');
}