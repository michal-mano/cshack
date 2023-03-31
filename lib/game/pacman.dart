import 'package:flutter/material.dart';
import 'package:cshack/globals.dart';

class PacmanDude extends StatelessWidget {

  List<String> birds = ['lib/game/images/saar.png','lib/game/images/saar.png', 'lib/game/images/michal.png'
    ,'lib/game/images/saarwithhat.png','lib/game/images/roee_with_hat.png','lib/game/images/michal_with_hat.png','lib/game/images/bird.png'];

  List<bool> birdsBool = [saarRegular, roeeRegular, michalRegular, saarWithHat, roeeWithHat, michalWithHat, true];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.asset(
        'lib/game/images/bird.png'
        ,color: Colors.yellow,
      ),
    );
  }
}