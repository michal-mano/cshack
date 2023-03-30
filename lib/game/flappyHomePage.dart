import 'dart:async';

import 'package:flutter/material.dart';
import 'bird.dart';

class flappyHomePage extends StatefulWidget {
  const flappyHomePage({Key? key}) : super(key: key);

  @override
  State<flappyHomePage> createState() => _flappyHomePageState();
}

class _flappyHomePageState extends State<flappyHomePage> {

  double birdYaxis = 0;


  void jump(){
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        birdYaxis -= 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: jump,
            child: AnimatedContainer(
              alignment: Alignment(0,birdYaxis),
              duration: Duration(milliseconds: 0),
              color: Colors.blue,
              child: MyBird(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    ));
  }
}
