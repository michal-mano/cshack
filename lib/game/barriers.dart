import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {

  final barrierWidth;
  final barrierHeight;
  final barrierX;
  final bool bottom;

  MyBarrier({this.barrierWidth, this.barrierHeight, required this.bottom, this.barrierX});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2* barrierX + barrierWidth)/ (2-barrierWidth), bottom?1:-1),
      child: Container(
          width: MediaQuery.of(context).size.width * barrierWidth / 2,
          height: MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
          decoration: BoxDecoration(
              color: Colors.green,
              //border: Border.all(width: 10 ,color: Colors.green.shade800),
              //borderRadius: BorderRadius.circular(15)

      )
      ),
    );
  }
}
