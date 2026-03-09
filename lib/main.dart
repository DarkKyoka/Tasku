import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_manager_app/HomePage.dart';
import 'package:task_manager_app/Task.dart';
import 'package:task_manager_app/TaskDialogue.dart';
import 'DBStuff/TaskRepository.dart';
import 'TaskListView.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:task_manager_app/DBStuff/database.dart';
import 'HomePage.dart';
import 'package:task_manager_app/DBStuff/database.dart';

final  AppDatabase db = AppDatabase();
final taskRepo = TaskRepository(db);

void main() {
  runApp(const MyApp());
  //debugPaintSizeEnabled = false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

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
        return Homepage();

      case 1:
        //return Taskdialogue();
        //return const Center(child: Text("taskMaker"));
      case 2:
        return const Center(child: Text("stats"));

      case 3:
        return const Center(child: Text("Profile"));

      default:
        return const SizedBox();
    }
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Homepage(),
      home: Builder( builder: (context) => Scaffold(
        extendBody: true,
        body: _getPage(),

        bottomNavigationBar:

        Stack(

          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,

          children: [
            Container(
              width: double.infinity,
              height: 70,
              color: Color.fromRGBO(23, 3, 18, 100),



              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Expanded(flex: 1 ,child: SizedBox()),

                  Expanded(
                    child: GestureDetector(
                      onTap: () => _chnageTab(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, color: Colors.white),
                          Text("Home", style: TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),

                  Expanded(flex: 2 ,child: SizedBox()),

                  Expanded(
                    child: GestureDetector(
                      onTap: () => _chnageTab(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.query_stats, color: Colors.white),
                          Text("Stats", style: TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),

                  Expanded(flex: 1 ,child: SizedBox()),


                  Expanded(
                    child: GestureDetector(
                      onTap: () => _chnageTab(3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, color: Colors.white),
                          Text("Profile", style: TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),


                ],

              ),
            ),

            // NEW TASK BUTTON
            Positioned(
                top: -5,

                child:
                GestureDetector(
                  onTap: () async {
                    final task = await Navigator.push<TaskModel>(
                      context,
                      MaterialPageRoute(builder: (context) => Taskdialogue()),

                    );

                    if (task != null) {
                      taskRepo.addTask(task);
                    }
                  },
                  
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Container(
                          width: 60,
                          height: 60,

                          //margin: EdgeInsetsGeometry.only(bottom: 10),

                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(7),
                            color: Color.fromRGBO(167, 84, 255, 100),

                          ),


                          child: Icon(Icons.add, color: Colors.white),
                        )




                      ]
                  ),

                )
            )
          ]



        )


        /* BottomNavigationBar(
              unselectedItemColor: Color.fromRGBO(247, 247, 255, 1),
              selectedItemColor: Color.fromRGBO(86, 227, 159, 1),

              backgroundColor: Color.fromRGBO(23, 3, 18, 1.0),

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white,),
                  label: "home",


                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.eighteen_up_rating_rounded, color: Colors.white),
                  label: "X"
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


        )
      */

      )

    ));
  }
}

