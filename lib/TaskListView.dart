
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/Task.dart';
import 'package:task_manager_app/TaskCard.dart';
import 'package:task_manager_app/TaskDialogue.dart';
import 'package:task_manager_app/HomePage.dart';

import 'package:task_manager_app/DBStuff/database.dart';

class TaskListView extends StatefulWidget {

  final List<Task> tasks; //holds all the available tasks

  final void Function(TaskModel) onAddTask;
  final void Function(Task) onToggleFavorite;

  const TaskListView({
    super.key,
    required this.tasks,
    required this.onAddTask,
    required this.onToggleFavorite
  });

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        color: Color.fromRGBO(39, 2, 36, 1.0),

        child:
          Column(
            children: [

              Container(
                padding: EdgeInsetsGeometry.only(top: 20),

                child:
                  Text(
                    "Your Tasks",
                    style: TextStyle(
                        color: Color.fromRGBO(247, 247, 255, 1),
                        fontSize: 22

                    ),
                  ),
              ),


              Expanded(
                child:
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 5),

                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 25,
                  ),

                  itemCount: widget.tasks.length,
                  itemBuilder: (context, index){
                      final task = widget.tasks[index];

                      return TaskCard(
                        title: task.taskName,
                        description: task.description,
                        isCompleted: task.isComplete,
                        isFavorite: task.isFavorite,
                        onFavoriteChanged: (newValue){
                          widget.onToggleFavorite(task);
                        },


                      );
                  }




                ),


              ),



            ]

          )

        ),

        floatingActionButton:
        FloatingActionButton(
          onPressed: () async {
            final task = await showDialog<TaskModel>(

              context: context,
              builder: (context) => const Taskdialogue(),
            );

            if (task != null) {
              widget.onAddTask(task);
            }
          },

          backgroundColor: Color.fromRGBO(23, 3, 18, 1.0),

          child:
            Icon(
              Icons.add,
              color: Color.fromRGBO(247, 247, 255, 1),
            ),

        ),

    );

  }
}