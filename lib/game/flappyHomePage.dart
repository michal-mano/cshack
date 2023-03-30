import 'dart:async';

import 'package:cshack/game/barriers.dart';
import 'package:flutter/material.dart';
import 'bird.dart';

class flappyHomePage extends StatefulWidget {
  const flappyHomePage({Key? key}) : super(key: key);

  @override
  State<flappyHomePage> createState() => _flappyHomePageState();
}

class _flappyHomePageState extends State<flappyHomePage> {
  static double birdYaxis = 0;
  static double birdWidth = 0.2;
  static double birdHeight = 0.2;

  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;
  //double barrierXone = 1;
  //double barrierXtwo = 2.5 ;

  //barrier variables
  static List<double> barrierX = [2,3.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [[0.4,0.6],[0.6,0.4]];



//D==0, U==1
  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  //bird is dead, I killed him, I killed him
  bool birdIsDead(){
    //return false; this is when roee plays
    if(birdYaxis > 1 || birdYaxis < -1){
      return true;
    }
    for (int i = 0; i< barrierX.length; i++){
      if(barrierX[i] <= birdWidth && barrierX[i] + barrierWidth >= -birdWidth
          && (birdYaxis <= -1 + barrierHeight[i][1] || birdYaxis + birdHeight >= 1 - barrierHeight[i][0])){
        return true;
      }
    }
    return false;
  }

  void resetGame(){
    //Navigator.pop(context);//dismiss the alert dialog
    setState(() {
      birdYaxis = 0;
      gameHasStarted = false;
      time = 0;
      initialHeight = birdYaxis;
      barrierX = [2,3.5];

    });
  }

  void _showDialog(){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                "G A M E  O V E R",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: (){
                  resetGame();
                  Navigator.pop(context);//dismiss the alert dialog
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: Text(
                      'PLAY AGAIN',
                      style: TextStyle(color: Colors.brown),
                    )
                  )
                )
              )
            ],
          );

    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -3.5 * time * time + 2 * time; //2.8 is initial y velocity
      setState(() {
        birdYaxis = initialHeight - height;
      });
      setState(() {
        if ( barrierX[0] < -2){
          barrierX[0] +=3.2;
        }
        else{
          barrierX[0] -= 0.05;
        }
      });
      setState(() {
        if ( barrierX[1] < -2){
          barrierX[1] +=3.2;
        }
        else{
          barrierX[1] -= 0.05;
        }
      });
      if (birdIsDead()) {
        timer.cancel();
        gameHasStarted = false;
        _showDialog();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                AnimatedContainer(
                  alignment: Alignment(0, birdYaxis),
                  duration: Duration(milliseconds: 0),
                  color: Colors.blue,
                  child: MyBird(
                      birdY: birdYaxis,
                      birdHeight: birdHeight,
                      birdWidth: birdWidth,
                  ),
                ),
                Container(
                  alignment: Alignment(0, -0.3),
                  child: gameHasStarted
                      ? Text("")
                      : Text("T A P  T O  P L A Y",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                //the U and D barriers(size) must sum up to 400 to make the same space
                AnimatedContainer(//1D
                  //alignment: Alignment(barrierX[0],1.1),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][0],
                      barrierX: barrierX[0],
                      bottom: true,
                  ),
                ),
                AnimatedContainer(//1U
                  //alignment: Alignment(barrierX[0],-1.1),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][1],
                      barrierX: barrierX[0],
                      bottom: false,
                  ),
                ),
                AnimatedContainer(//2D
                  //alignment: Alignment(barrierX[1],1.1),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    barrierWidth: barrierWidth,
                    barrierHeight: barrierHeight[1][0],
                    barrierX: barrierX[1],
                    bottom: true,
                  ),
                ),
                AnimatedContainer(//2U
                  //alignment: Alignment(barrierX[1],-1.1),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][1],
                      barrierX: barrierX[1],
                      bottom: false,
                  ),
                ),

              ],
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("SCORE",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("0",
                          style: TextStyle(color: Colors.white, fontSize: 35)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("BEST",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("10",
                          style: TextStyle(color: Colors.white, fontSize: 35)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
