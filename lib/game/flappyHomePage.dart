import 'dart:async';

import 'package:flutter/material.dart';
import 'bird.dart';

class flappyHomePage extends StatefulWidget {
  const flappyHomePage({Key? key}) : super(key: key);

  @override
  State<flappyHomePage> createState() => _flappyHomePageState();
}

class _flappyHomePageState extends State<flappyHomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time; //2.8 is initial y velocity
      setState(() {
        birdYaxis = initialHeight - height;
      });
      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
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
            onTap: () {
              if (gameHasStarted) {
                jump();
              } else {
                startGame();
              }
            },
            child: AnimatedContainer(
              alignment: Alignment(0, birdYaxis),
              duration: Duration(milliseconds: 0),
              color: Colors.blue,
              child: MyBird(),
            ),
          ),
        ),
        Container(
          height: 15,
          color: Colors.green,
        ),
        Expanded(
          child: Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("SCORE", style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(height: 20
                      ,),
                    Text("0", style: TextStyle(color: Colors.white, fontSize: 35)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("BEST", style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text("10", style: TextStyle(color: Colors.white, fontSize: 35)),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
