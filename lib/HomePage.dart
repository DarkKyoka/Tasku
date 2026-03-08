import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/Task.dart';
import 'package:task_manager_app/TaskDialogue.dart';
import 'package:task_manager_app/globals.dart';
import 'package:task_manager_app/DBStuff/database.dart';
import 'TaskListView.dart';
import 'main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState(); 
}

class _HomepageState extends State<Homepage> {

  //final List<TaskModel> taskList_regular = [];
  //final List<TaskModel> taskList_favs = [];

  //List<TaskModel> get CombinedTasks => [...taskList_favs, ...taskList_regular];



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

  void openAddTaskDialog() async{
    final task = await showDialog<TaskModel>(
      context: context,
      builder: (context) => Taskdialogue(),
    );

    if(task != null){
      addTask(task);
    }
  }

  //Which tab is selected?
  int _selectedIndex = 0;


  void _chnageTab(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage(){
    switch(_selectedIndex){
      case 0:
        return StreamBuilder<List<Task>>(
          stream: db.watchAllTasks(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            final allTasks = snapshot.data!;
            final favs = allTasks.where((t) => t.isFavorite).toList();
            final regular = allTasks.where((t) => !t.isFavorite).toList();
            final combined = [...favs, ...regular];

            return TaskListView(
              tasks: combined,
              onAddTask: addTask,
              onToggleFavorite: toggleFavorite,
            );
          },
        );
      case 1:
        return const Center(child: Text("Fav Page"));
      case 2:
        return const Center(child: Text("Profile Page"));
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 3, 18, 1.0),
        title:
        Text(
          'FluTasks test 1.0',
          style: TextStyle(
            color: Color.fromRGBO(86, 227, 159, 1),
            fontSize: 24
          ),
        ),
        centerTitle: true,
      ),
      body: _getPage(),

      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color.fromRGBO(247, 247, 255, 1),
          selectedItemColor: Color.fromRGBO(86, 227, 159, 1),

          backgroundColor: Color.fromRGBO(23, 3, 18, 1.0),


          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white,),
              label: "home",


            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.star, color: Colors.white,),
              label: 'Favorites',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white,),
              label: 'Profile'
            ),

          ],

          currentIndex: _selectedIndex,
          onTap: _chnageTab,


        ),
    );
  }
}