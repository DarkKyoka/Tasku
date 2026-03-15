import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/DBStuff/database.dart';
import 'package:task_manager_app/Task.dart';
import 'package:task_manager_app/TaskMaker.dart';
import 'package:task_manager_app/TaskListView.dart';
import 'main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState(); 
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color.fromRGBO(23, 3, 18, 1.0),
        title:
        Text(
          'Hey, Username123👋',
          style: TextStyle(
            color: Color.fromRGBO(86, 227, 159, 1),
            fontSize: 20
          ),
        ),
        centerTitle: true,
      ),

      body:
         StreamBuilder<List<Task>>(
            stream: db.watchAllTasks(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              final allTasks = snapshot.data!;

              //on going
              final favs = allTasks.where((t) => t.isFavorite && !t.isComplete).toList();           // fav = true, Completed = false
              final regular = allTasks.where((t) => !t.isFavorite && !t.isComplete).toList();       // fav = false ...

              //completed
              final completedRegular = allTasks.where((t) => t.isComplete && !t.isFavorite).toList();
              final favCompleted = allTasks.where((t) => t.isComplete && t.isFavorite).toList();   // completed = true, fav = true

              final activeCombinedTasks = [...favs, ...regular];
              final completedCombinedTasks = [...favCompleted, ...completedRegular];

              // Data of Task List
              return TaskListView(
                onGoingTasks: activeCombinedTasks,
                completeTasks: completedCombinedTasks,
                onAddTask: (task) => taskRepo.addTask(task),
                onToggleFavorite: (task) => taskRepo.toggleFavorite(task),
                onCompleteTask: (task) => taskRepo.completeTask(task),
              );


            },
        ),

    );
  }
}