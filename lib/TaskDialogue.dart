import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/HomePage.dart';
import 'package:task_manager_app/Task.dart';
import 'package:task_manager_app/TaskListView.dart';
import 'package:task_manager_app/globals.dart';

class Taskdialogue extends StatefulWidget {
  const Taskdialogue({super.key});

  @override
  State<Taskdialogue> createState() => _TaskdialogueState();
}

class _TaskdialogueState extends State<Taskdialogue> {
  final TextEditingController nameControler = TextEditingController();

  final TextEditingController descriptionControler = TextEditingController();

  bool toggledFavorite = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(


      backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),

      content: SizedBox(

        height: 220,

        child: Column(

          children: [
            Row(
              children: [
                const Text(
                  "Add a New Task",
                  style: TextStyle(color: Color.fromRGBO(247, 247, 255, 1)),
                ),
                Spacer(),
                Tooltip(
                  message: "Add to favorites",

                  triggerMode: TooltipTriggerMode.longPress,
                  showDuration: Duration(seconds: 1),


                  child: IconButton(
                    icon: Icon(toggledFavorite ? Icons.star : CupertinoIcons.star),

                    onPressed: () => {
                        setState(() {
                          toggledFavorite = !toggledFavorite;
                        })
                    }

                  ),


                )


              ],

            ),


            TextField(
              controller: nameControler,

              style: TextStyle(color: Colors.white),

              decoration: InputDecoration(
                labelText: "Enter Task name",
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),


              ),
            ),

            TextField(
              controller: descriptionControler,
              autocorrect: true,

              style: TextStyle(color: Colors.white),

              decoration: InputDecoration(
                  labelText: "Enter a Description",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 12)

              ),
            ),

            SizedBox(height: 10,),

            Row(

                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child:
                      Text("Cancel", style: TextStyle(color: Color.fromRGBO(226, 132, 19,1 ))),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      final task = TaskModel(
                        nameControler.text,
                        descriptionControler.text,
                        false,
                        toggledFavorite,
                      );


                      Navigator.pop(context, task);
                    },
                    child: const Text("Add", style: TextStyle(color: Color.fromRGBO(
                        5, 17, 71, 1.0)),),
                  ),

                ]
            )


          ],


        ),

      )



    );
  }
}