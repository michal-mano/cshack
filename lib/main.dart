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
  globalFamilyId = await loadString('family_id');
  highestScore = (await loadString('highestScore') != "") ? int.parse(await loadString('highestScore') ) : 0;
  power1 = (await loadString('power1') != "") ? int.parse(await loadString('power1')) : 0;
  power2 = (await loadString('power2') != "") ? int.parse(await loadString('power2')) : 0;
  strengthCoins = (await loadString('strengthCoins') != "") ? int.parse(await loadString('strengthCoins')) : 0;
  roeeWithHat = (await loadString('roeeWithHat') == "true") ? true : false;
  saarRegular = (await loadString('saarRegular') == "true") ? true : false;
  saarWithHat = (await loadString('saarWithHat') == "true") ? true : false;
  michalRegular = (await loadString('michalRegular') == "true") ? true : false;
  michalWithHat = (await loadString('michalWithHat') == "true") ? true : false;

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

