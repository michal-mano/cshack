import 'package:flutter/material.dart';
import './game/flappyMain.dart';
import 'globals.dart';
import './game/paci.dart';


class GamesPage extends StatefulWidget {
  const GamesPage({super.key, required this.title});

  final String title;

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(widget.title),
      body: GridView.count(
        crossAxisCount: 2,
        children: [IconButton(
          icon: Image.asset('lib/game/images/bird.png'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => const flappy()),
            );
          },
        ),IconButton(
          icon: Image.asset('lib/game/images/pacman.png', scale: 7,),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => const flappy()),
            );
          },
        )],
      )
    );
  }
}