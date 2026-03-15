import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/HomePage.dart';
import 'package:task_manager_app/Task.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:task_manager_app/main.dart';

import 'DBStuff/database.dart';

class Taskdialogue extends StatefulWidget {
  const Taskdialogue({super.key});

  @override
  State<Taskdialogue> createState() => _TaskdialogueState();
}

class _TaskdialogueState extends State<Taskdialogue> {
  final TextEditingController nameControler = TextEditingController();

  final TextEditingController descriptionControler = TextEditingController();

  bool toggledFavorite = false;

  int _selectedPriority = 1; // 0=Low, 1=Normal, 2=High

  Widget _priorityButton(String label, int index) {
    bool isSelected = _selectedPriority == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedPriority = index),
      child: Container(
        alignment: AlignmentGeometry.center,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Color.fromRGBO(11, 0, 8, 1.0),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: index == 2 ? Colors.red : Colors.white24,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: index == 2 ? Colors.red : Colors.white,
              ),
            ),

            if (isSelected) ...[
              SizedBox(width: 6),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(86, 227, 159, 1),
                  shape: BoxShape.circle,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  void addTask(TaskModel task) {
    db.addTask(TasksCompanion.insert(
      taskName: task.taskName,
      description: task.description,
      isComplete: Value(task.isComplete),
      isFavorite: Value(task.isFavorite),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(39, 2, 36, 1.0),

      appBar: 
        AppBar(
          //automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),

          backgroundColor: Color.fromRGBO(23, 3, 18, 100),
          toolbarHeight: 77,
          
          title: Center(child: Text("New Task!", style: TextStyle(color: Colors.white))),

        ),

      body:
      SingleChildScrollView(

        child:
        Container(
          color: Color.fromRGBO(39, 2, 36, 1.0),
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 70),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Task Name
              Text("Task Name", style: TextStyle(color: Color.fromRGBO(247, 247, 255, 1), fontSize: 16)),
              SizedBox(height: 8),
              TextField(
                controller: nameControler,
                style: TextStyle(color: Colors.white),
                decoration:
                InputDecoration(
                  hintText: "Shopping, Studying etc...",
                  hintStyle: TextStyle(color: Colors.white38, fontSize: 12),
                  filled: true,
                  fillColor: Color.fromRGBO(23, 3, 18, 1.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),

              SizedBox(height: 24),

              // Task Description
              Text("Task Description", style: TextStyle(color: Color.fromRGBO(247, 247, 255, 1), fontSize: 16)),
              SizedBox(height: 8),
              TextField(
                controller: descriptionControler,
                maxLines: 4,
                style: TextStyle(color: Colors.white),
                decoration:
                InputDecoration(
                  hintText: "Do this, do that...",
                  hintStyle: TextStyle(color: Colors.white38, fontSize: 12),
                  filled: true,
                  fillColor: Color.fromRGBO(23, 3, 18, 1.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),

              SizedBox(height: 24),

              // Priority
              Row(
                children: [
                  Text("Priority", style: TextStyle(color: Color.fromRGBO(247, 247, 255, 1), fontSize: 16)),
                  SizedBox(width: 4),
                  Icon(Icons.info_outline, color: Colors.white38, size: 16),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  _priorityButton("Low", 0),
                  SizedBox(width: 8),
                  _priorityButton("Normal", 1),
                  SizedBox(width: 8),
                  _priorityButton("High", 2),
                ],
              ),

              SizedBox(height: 24),

              // Other
              Text("Other", style: TextStyle(color: Color.fromRGBO(247, 247, 255, 1), fontSize: 16)),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () => setState(() => toggledFavorite = !toggledFavorite),
                child: Row(
                  children: [
                    Icon(
                      toggledFavorite ? Icons.star : Icons.star_border,
                      color: toggledFavorite ? Colors.amber : Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text("Mark as Favorite", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),


            ],
          ),
        ),


      ),




      bottomNavigationBar: Container(

        color: Color.fromRGBO(39, 2, 36, 1.0),
        padding: EdgeInsetsGeometry.all(16),

          child:
            Row(
              children: [


                // Cancel Button
                Container(
                  width: 180,

                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child:
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(38, 0, 1, 1),
                        borderRadius: BorderRadius.circular(7),
                      ),

                      child:
                      Center(
                        child: Text("Cancel", style: TextStyle(color: Color.fromRGBO(255, 42, 145, 1))),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                // ADD BUTTON
                Expanded(
                  child: GestureDetector(
                    onTap: () async{

                      if(nameControler.text.isNotEmpty){
                        final task = TaskModel(
                          nameControler.text,
                          descriptionControler.text,
                          false,
                          toggledFavorite,
                        );

                        Navigator.pop(context, task);

                      }


                    },

                    child:
                    Container(
                      height: 48,
                      decoration:
                      BoxDecoration(
                        color: Color.fromRGBO(0, 9, 11, 1.0),
                        borderRadius: BorderRadius.circular(7),
                      ),

                      child:
                      Center(
                        child: Text("Add", style: TextStyle(color: Color.fromRGBO(86, 227, 159, 1))),
                      ),
                    ),
                  ),
                ),


              ],
            )
      ),


    );
  }
}