import 'package:cshack/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flappyHomePage.dart';

class flappy extends StatelessWidget {
  const flappy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: flappyHomePage(),
    );
  }
}
