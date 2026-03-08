import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_manager_app/HomePage.dart';
import 'package:task_manager_app/Task.dart';

import 'package:task_manager_app/DBStuff/database.dart';
import 'HomePage.dart';

final  AppDatabase db = AppDatabase();

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

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

