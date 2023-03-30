import 'package:flutter/material.dart';
import './game/flappyMain.dart';
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
        )],
      )
    );
  }
}