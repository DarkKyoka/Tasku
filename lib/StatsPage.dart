
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,

          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Statspage()

            )
          ],
          // your stat cards go here
        ),
      ),
    );
  }
}