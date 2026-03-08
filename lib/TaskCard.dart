import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/Task.dart';

import 'TaskListView.dart';
import 'HomePage.dart';

class TaskCard extends StatefulWidget {
  //final void Function(Task) onAddTasktoFavorites;

  String title;
  String description;
  bool isCompleted;
  bool isFavorite;
  final void Function(bool)? onFavoriteChanged;


   TaskCard({
      super.key,
      required this.title,
      required this.description,
      required this.isCompleted,
      required this.isFavorite,
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
    isCompleted = widget.isCompleted;
    isFavorite = widget.isFavorite;
  }

  @override
  void didUpdateWidget(TaskCard oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.isFavorite != widget.isFavorite){
      setState(() {
        isFavorite = widget.isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 30),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(23, 3, 18, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isCompleted,
            onChanged: (value) {
              setState(() {
                isCompleted = value ?? false; // update local state
              });
            },
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: const Color.fromRGBO(247, 247, 255, 1.0),
                    fontSize: 16,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: const Color.fromRGBO(226, 132, 19, 1),
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