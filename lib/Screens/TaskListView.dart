
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/Classes/Task.dart';
import 'package:task_manager_app/ItemCards//TaskCard.dart';
import 'package:task_manager_app/DBStuff/database.dart';

class TaskListView extends StatefulWidget {

  final List<Task> onGoingTasks; //holds all the available tasks
  final List<Task> completeTasks; // holds the complete tasks
  
  final void Function(TaskModel) onAddTask;
  final void Function(Task) onToggleFavorite;
  final void Function(Task) onCompleteTask;

  const TaskListView({
    super.key,
    required this.onGoingTasks,
    required this.completeTasks,
    required this.onAddTask,
    required this.onToggleFavorite,
    required this.onCompleteTask
  });

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {


  @override
  Widget build(BuildContext context) {
      //body:
      return Container(
        color: Color.fromRGBO(39, 2, 36, 1.0),

        child:
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                color: Color.fromRGBO(39, 2, 36, 1.0),

                child: SingleChildScrollView(

                  padding: EdgeInsets.only(bottom: 95),

                  child:
                  Column(
                      children: [

                        // OnGoing List
                        Container(
                            padding: EdgeInsetsGeometry.only(top: 20, left: 20),
                            alignment: Alignment.topLeft,

                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Your Tasks (${widget.onGoingTasks.length})",
                                  style: TextStyle(
                                      color: Color.fromRGBO(247, 247, 255, 1),
                                      fontSize: 22

                                  ),
                                ),

                                Divider(color: Colors.white, thickness: 1, endIndent: 180),

                                ...widget.onGoingTasks.map((task) => Padding(
                                  padding: EdgeInsetsGeometry.only(bottom: 5),
                                  child: TaskCard(
                                    task: task,
                                    onFavoriteChanged: (newValue) => widget.onToggleFavorite(task),

                                  ),

                                ))
                                /*
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) => SizedBox(height: 5),

                                  padding: EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 25,
                                  ),

                                  itemCount: widget.onGoingTasks.length,
                                  itemBuilder: (context, index){
                                    final task = widget.onGoingTasks[index];

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
                              */


                              ],

                            )



                        ),


                        SizedBox( height: 100,),

                        // Completed List
                        Container(
                            color: Color.fromRGBO(39, 2, 36, 1.0),

                            margin: EdgeInsetsGeometry.only(left: 20),
                            alignment: Alignment.topLeft,
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text("Completed  (${widget.completeTasks.length})",
                                    style:
                                    TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    )

                                ),

                                Divider(color: Colors.white, thickness: 1, endIndent: 180),

                                ...widget.completeTasks.map((task) => Padding(
                                  padding: EdgeInsetsGeometry.only(bottom: 5),
                                  child: TaskCard(
                                      task: task,
                                      onFavoriteChanged: (newValue) => widget.onToggleFavorite(task),
                                      

                                  ),

                                )),
                                /*
                            ListView.separated(

                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),

                                separatorBuilder: (context, index) => SizedBox(height: 5),

                                padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 25,
                                ),

                                itemCount: widget.completeTasks.length,
                                itemBuilder: (context, index){
                                  final task = widget.completeTasks[index];

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
                            */

                                //SizedBox(height: 100,)i di

                              ],
                            )

                        ),

                      ]

                  ),

                )
                ,
              ),

            )


        );


  }
}