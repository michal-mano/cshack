import 'package:flutter/material.dart';
import 'database_manager.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: ParentOrChild(),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'ID Number',
            ),
            onSaved: (String? value) {},
          ),
          ElevatedButton(
              child: const Text('Connect'),
              onPressed: () {
              }, //SEND TO DATABASE
              )
        ]
      )
    );
}}
class ParentOrChild extends StatefulWidget {
  const ParentOrChild({super.key});
  @override
  State<ParentOrChild> createState() => _ParentOrChildState();
}

class _ParentOrChildState extends State<ParentOrChild> {
  int value = 0;
  Widget CustomRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed:() {
        setState(() {
          value = index;
        });

      },
      style: OutlinedButton.styleFrom(
          side: BorderSide(
          color: (value == index) ? Colors.blue : Colors.black,
          ),
        backgroundColor: (value == index) ? Colors.lightBlue: Colors.white,
        ),
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.white : Colors.black,
        ),
      ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomRadioButton("Child", 1),
        CustomRadioButton("Parent", 2)
      ],
    );
  }
}