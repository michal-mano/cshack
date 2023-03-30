import 'package:flutter/material.dart';
import 'PersistentTabBar.dart';
import 'globals.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = "peepee poopoo";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget> [
    Text(
      'Index 0: Tasks',
      style:optionStyle,
    ),
    Text(
      'Index 1: Games',
      style: optionStyle,
    ),
    Text(
      'index 2: Store',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(widget.title),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: const PersistentTabBar(),
    );
  }
}
