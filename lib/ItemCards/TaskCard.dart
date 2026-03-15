import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/DBStuff/database.dart';
import 'package:task_manager_app/main.dart';

class TaskCard extends StatefulWidget {

  Task task;
  final void Function(bool)? onFavoriteChanged;


   TaskCard({
      super.key,
      required this.task,
      this.onFavoriteChanged,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late bool isCompleted;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    // initialize local state from the widget
    isCompleted = widget.task.isComplete;
    isFavorite = widget.task.isFavorite;
  }

  @override
  void didUpdateWidget(TaskCard oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.task.isFavorite != widget.task.isFavorite){
      setState(() {
        isFavorite = widget.task.isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 30),

      decoration: BoxDecoration(
        color: Color.fromRGBO(23, 3, 18, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          Checkbox(
            value: isCompleted,
            onChanged: (value) {
              setState(() {
                isCompleted = value ?? false;

                if (isCompleted) {
                  taskRepo.completeTask(widget.task);
                } else {
                  taskRepo.unCompleteTask(widget.task);
                }

              });
            },
          ),


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.taskName,
                  style: TextStyle(
                    color: Color.fromRGBO(247, 247, 255, 1.0),
                    fontSize: 16,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(
                  widget.task.description,
                  style: TextStyle(
                    color: Color.fromRGBO(226, 132, 19, 1),
                    fontSize: 12,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),
          ),

          IconButton(



            onPressed: () {
              if(widget.onFavoriteChanged != null){
                widget.onFavoriteChanged!(isFavorite);
              }

            },
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: Colors.yellowAccent,
            ),
          ),
        ],
      ),
    );
  }
}