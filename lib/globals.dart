import 'package:flutter/material.dart';
String globalUserType = "";
String globalFamilyId = "";
int highestScore = 0;
int power1 = 0;
int power2 = 0;
int strengthCoins = 0;

AppBar MyAppBar(title) {
  return AppBar(
    title: Text(title),
    actions: [
      Container(
          alignment: Alignment.center,
          child: Text(
            strengthCoins.toString(),
            style: TextStyle(fontSize: 20),
          )),
      Icon(Icons.build_circle),
      Container(
        width: 20,
        child: Text(""),
      ),
    ],
  );
}