import 'package:cshack/globals.dart';
import 'package:flutter/material.dart';
import 'utils.dart';
import 'database_manager.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setup')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: ParentOrChild(),
          ),
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'ID Number',
            ),
            onSaved: (String? value) {},
          ),
          ElevatedButton(
            onPressed: () async {
              await saveString('UID', _controller.text);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class ParentOrChild extends StatefulWidget {
  const ParentOrChild({super.key});

  @override
  State<ParentOrChild> createState() => _ParentOrChildState();
}

class _ParentOrChildState extends State<ParentOrChild> {
  int value = 0;

  Widget CustomRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () async {
        await saveString("userType", text);
        globalUserType = text;
        setState(() {
          value = index;
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: (value == index) ? Colors.blue : Colors.black,
        ),
        backgroundColor: (value == index) ? Colors.lightBlue : Colors.white,
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
        CustomRadioButton(USER_TYPE_CHILD, 1),
        CustomRadioButton(USER_TYPE_PARENT, 2)
      ],
    );
  }
}
