import 'package:cshack/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pacmanHomePage.dart';

class paci extends StatelessWidget {
  const paci({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pacmanHomePage(),
    );
  }
}