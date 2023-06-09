import 'package:flutter/material.dart';
String globalUserType = "";
String globalFamilyId = "";
int highestScore = 0;
int power1 = 0;
int power2 = 0;
int strengthCoins = 0;
bool saarRegular = false;
bool saarWithHat = false;
bool roeeRegular = true;
bool roeeWithHat = false;
bool michalRegular = false;
bool michalWithHat = false;

AppBar MyAppBar(title) {
  return AppBar(
    toolbarHeight: 75,
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