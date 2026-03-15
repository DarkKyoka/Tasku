



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager_app/ItemCards/StatCard.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileState();

}

class _ProfileState extends State<Profilescreen>{

  File? _bannerImage;
  File? _pfpImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isBanner) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isBanner) {
          _bannerImage = File(image.path);
        } else {
          _pfpImage = File(image.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 2, 36, 1.0),
      appBar: AppBar(
        title: Text("Profile Overview", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(23, 3, 18, 1.0),
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Column(
              children: [

                // the Gray Background that will go bellow the Cover and the Pfp and will be visible on the User details and Buttons
                Container(
                  color: Color.fromRGBO(18, 17, 17, 100),

                  child:
                  SizedBox(
                    width: double.infinity,
                    height: 400,

                    // Here will sit the Banner and the Pfp Section
                    child: Stack(


                      children: [
                        //Banner
                        Container(
                          width: double.infinity,
                          color: Colors.black45,
                          child:
                            SizedBox(
                              height: 198,
                              child: Text("Banner", textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),

                            ),
                        ),


                        Positioned(
                          top: 145,
                          child:
                            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                              child:
                                Row(

                                  children: [

                                    CircleAvatar(radius: 70,),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,


                                      children: [
                                        SizedBox(height: 55,),
                                        Text("Name0992929", style: TextStyle(fontSize: 24),),
                                        Text("Profile tittle", style: TextStyle(fontSize: 15),),
                                        Text("Level: 10", style: TextStyle(fontSize: 16) ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 195,
                                              height: 20,


                                              child:
                                              ClipRRect(

                                                borderRadius: BorderRadiusGeometry.circular(25),

                                                child:
                                                LinearProgressIndicator(
                                                  color: Color.fromRGBO(235, 0, 78, 100),
                                                  backgroundColor: Color.fromRGBO(11, 0, 8, 100),
                                                  value: 0.7,
                                                ),
                                              )


                                            )


                                          ],
                                        )
                                      ],
                                    )


                                  ]

                                ),


                            ),


                        ),

                        Text("Grey Background")

                      ],

                    ),

                  ),

                ),



                // Here i will Rest the Stats and Budgets Screen with the Cards
                      // <---

              ],

            )






          ],


        ),
      ),
    );
  }
}