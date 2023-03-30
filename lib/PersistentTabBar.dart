import 'package:cshack/login_page.dart';
import 'package:cshack/tasks.dart';
import 'package:flutter/material.dart';
import './game/flappyMain.dart';
import 'gamelibrary.dart';
import 'login_page.dart';

class PersistentTabBar extends StatelessWidget {
  const PersistentTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.lightBlue,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.check_box),text: "Tasks"),
                Tab(icon: Icon(Icons.games),text: "Games"),
                Tab(icon: Icon(Icons.store),text: "Store"),
              ],
            ),
        body: TabBarView(
          children: [
            TaskPage(title: "Tasks"),
            GamesPage(title: "Games"),
            LoginPage(title: "Login")
          ],
        ),
      ),
    );
  }
}