



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
                  color: Colors.grey,

                  child:
                  SizedBox(
                    width: double.infinity,
                    height: 400,

                    // Here will sit the Banner and the Pfp Section
                    child: Column(


                      children: [
                        //Banner
                        Container(
                          width: double.infinity,
                          color: Colors.black45,
                          child:
                            SizedBox(
                              height: 198,

                            ),
                        )




                      ],
                    ),

                  ),

                )

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