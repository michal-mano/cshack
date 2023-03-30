import 'package:cshack/globals.dart';
import 'package:flutter/material.dart';
import 'tasks.dart';
import './game/flappyMain.dart';
import 'utils.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'globals.dart';

void main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  globalUserType = await loadString('UID');

  runApp(MyApp(
    initialRoute: globalUserType.isEmpty ? '/setUID' : '/',
  ));
}

class MyApp extends StatelessWidget {
/*
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
*/

  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        '/': (context) => const MyHomePage(),
        '/setUID': (context) => const LoginPage(title: "login peepoo"),
      },
    );
  }
}

