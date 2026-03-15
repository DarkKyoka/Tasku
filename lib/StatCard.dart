

import 'package:flutter/widgets.dart';

enum statNameColor{
  white,
  green,
  red;
}

class StatCard extends StatelessWidget {

  final String statName;
  final String statValue;
  final statNameColor labelColor;

  const StatCard({
    required this.statName,
    required this.statValue,
    this.labelColor = statNameColor.white,

  });

  Color _getStatNameColor(){
    switch(labelColor){
      case statNameColor.white: return Color.fromRGBO(255, 255, 255, 100);
      case statNameColor.green: return Color.fromRGBO(75, 255, 171, 100);
      case statNameColor.red: return Color.fromRGBO(243, 89, 69, 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromRGBO(11, 0, 8, 100),

      child: Column(


        children: [
          Text(statName),
          Text(statValue, style: TextStyle(color: _getStatNameColor(),))
        ],

      ),
    );
  }
  
  

}