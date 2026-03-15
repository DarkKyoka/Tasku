
import 'package:flutter/material.dart';
import 'package:task_manager_app/ItemCards//StatCard.dart';

class Statspage extends StatefulWidget {
  const Statspage({super.key});

  @override
  State<Statspage> createState() => _StatsPageState();
}

class _StatsPageState extends State<Statspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 2, 36, 1.0),
      appBar: AppBar(
        title: Text("Stats", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(23, 3, 18, 1.0),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 10),
        /*
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,

          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: StatCard(statName: "Total Tasks",statValue: "100", labelColor: statNameColor.white,)

            ),

            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: StatCard(statName: "Tasks Completed",statValue: "100", labelColor: statNameColor.white,)

            )


          ],
          // your stat cards go here
        ),

         */

        child:
          //Scales the height symetrically between children by scaling
          // the smallest object to the largest
          //IntrinsicHeight(
          //child:
          Column(

            children: [
              StatCard(
                statName: "Total Tasks Made",
                statValue: "100",
                labelColor: statNameColor.white,

              ),
              SizedBox(height: 6,),

              //  Tasks Complete  & InComplete
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 100,
                      child:
                      StatCard(
                        statName: "Tasks Complete",
                        statValue: "100",
                        labelColor: statNameColor.green,
                      ),
                    ),

                    SizedBox(width: 4,),

                    Expanded(
                        flex: 100,
                        child:
                        StatCard(
                          statName: "Tasks Incomplete",
                          statValue: "8",
                          labelColor: statNameColor.red,
                        )
                    )

                  ],
                ),
              ),


              SizedBox(height: 6,),

              // Level & Xp to level up
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 35,
                      child:
                      StatCard(
                        statName: "Level",
                        statValue: "20",
                        labelColor: statNameColor.green,
                      ),
                    ),

                    SizedBox(width: 4,),

                    Expanded(
                        flex: 80,
                        child:
                        StatCard(
                          statName: "XP to level up",
                          statValue: "1.291",
                          labelColor: statNameColor.red,
                        )
                    ),

                  ],
                ),
              ),

              SizedBox(height: 6,),

              // Total Xp Gained & Highest Daily Streaks
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 40,
                      child:
                      StatCard(
                        statName: "Total XP Gained",
                        statValue: "20.902",
                        labelColor: statNameColor.white,
                      ),
                    ),

                    SizedBox(width: 4,),

                    Expanded(
                        flex: 30,
                        child:
                        StatCard(
                          statName: "Highest Daily Streaks",
                          statValue: "5",
                          labelColor: statNameColor.green,
                        )
                    ),

                  ],
                ),
              ),

              SizedBox(height: 6,),

              // Total Xp Gained & Highest Daily Streaks
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 40,
                      child:
                      StatCard(
                        statName: "Total Favorite Tasks",
                        statValue: "20",
                        labelColor: statNameColor.white,
                      ),
                    ),

                    SizedBox(width: 4,),

                    Expanded(
                        flex: 50,
                        child:
                        StatCard(
                          statName: "Broken Streaks",
                          statValue: "5",
                          labelColor: statNameColor.green,
                        )
                    ),


                  ],
                ),
              ),

              SizedBox(height: 15,),
              Text("More Stats Will arrive on future updates!", style: TextStyle(color: Colors.white),)


            ],
          )


      ),
    );
  }
}