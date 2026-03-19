
import 'dart:ffi';

import 'package:flutter/material.dart';

enum statNameColor{
  white,
  green,
  red;
}

class StatCard extends StatelessWidget {

  final String statName;
  final String statValue;
  final statNameColor labelColor;

  // Non Mandatory Properties
  final double? titleFontSize;
  final double? valueFontSize;

  const StatCard({
    required this.statName,
    required this.statValue,
    this.labelColor = statNameColor.white,

    this.titleFontSize,
    this.valueFontSize,
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
      //alignment: AlignmentGeometry.center,
      padding: EdgeInsets.all(12),
      //height: 100,
      //width: double.infinity,

      decoration:
        BoxDecoration(

          color: Color.fromRGBO(11, 0, 8, 100),
          borderRadius: BorderRadius.circular(7),
        ),
      
      
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(statName,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: titleFontSize ?? 16,
                  color: _getStatNameColor(),
                  fontWeight: FontWeight.w500,

              )
          ),

          Padding(
            padding: EdgeInsets.only(top: 8),
            child:
              Text(statValue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: valueFontSize ?? 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  )
              ),

          )

        ],

      ),
    );
  }
  
  

}