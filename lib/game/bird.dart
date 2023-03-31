import 'package:flutter/material.dart';
import 'package:cshack/globals.dart';

class MyBird extends StatelessWidget {

  final birdY;
  final double birdWidth;
  final double birdHeight;
  final birdNum;

  List<String> birds = ['lib/game/images/saar.png','lib/game/images/saar.png', 'lib/game/images/michal.png'
  ,'lib/game/images/saarwithhat.png','lib/game/images/roee_with_hat.png','lib/game/images/michal_with_hat.png','lib/game/images/bird.png'];

  List<bool> birdsBool = [saarRegular, roeeRegular, michalRegular, saarWithHat, roeeWithHat, michalWithHat, true];

  MyBird({this.birdY, required this.birdWidth, required this.birdHeight, this.birdNum});

  Widget getbird(BuildContext context){
    if(birdNum == 1 && saarRegular){
      return Image.asset(
          'lib/game/images/saar.png',
          width: MediaQuery.of(context).size.height*birdWidth /2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight /2,
          fit: BoxFit.fill
      );
    }
    else if(birdNum == 2 && roeeRegular){
      return Image.asset(
          'lib/game/images/saar.png',
          width: MediaQuery.of(context).size.height*birdWidth /2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight /2,
          fit: BoxFit.fill
      );
    }
    else if(birdNum == 3 && michalRegular){
      return Image.asset(
          'lib/game/images/michal.png',
          width: MediaQuery.of(context).size.height*birdWidth /2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight /2,
          fit: BoxFit.fill
      );
    }
    else if(birdNum == 4 && saarWithHat){
      return Image.asset(
          'lib/game/images/saarwithhat.png',
          width: MediaQuery.of(context).size.height*birdWidth /2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight /2,
          fit: BoxFit.fill
      );
    }
    else if(birdNum == 5 && roeeWithHat){
      return Image.asset(
          'lib/game/images/roee_with_hat.png',
          width: MediaQuery.of(context).size.height*birdWidth /2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight /2,
          fit: BoxFit.fill
      );
    }
    else if(birdNum == 6 && michalWithHat){
      return Image.asset(
          'lib/game/images/michal_with_hat.png',
          width: MediaQuery.of(context).size.height*birdWidth /2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight /2,
          fit: BoxFit.fill
      );
    }
    else{
      return Image.asset(
          'lib/game/images/bird.png',
          width: MediaQuery.of(context).size.height*birdWidth /2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight /2,
          fit: BoxFit.fill
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    List<bool> birdsBool = [saarRegular, roeeRegular, michalRegular, saarWithHat, roeeWithHat, michalWithHat, true];
    return Container(
      alignment: Alignment(0,(2 * birdY + birdHeight) / (2 - birdHeight)),
      child: Image.asset(
          birdsBool[birdNum]? '${birds[birdNum]}' : 'lib/game/images/bird.png' ,
          width: MediaQuery.of(context).size.height*birdWidth /2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight /2,
          fit: BoxFit.fill
      )
    );
  }
}