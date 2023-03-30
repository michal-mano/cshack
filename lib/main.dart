import 'package:cshack/globals.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'tasks.dart';
import './game/flappyMain.dart';
import 'utils.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'globals.dart';
import 'database_manager.dart';
import 'firebase_options.dart';

void main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  globalUserType = await loadString('userType');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(
    initialRoute: globalUserType == "" ? '/loginScreen' : '/',
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
        '/loginScreen': (context) => const LoginPage(title: "login peepoo"),
      },
    );
  }
}

