import 'package:flutter/material.dart';


class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.title});

  final String title;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('Next'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        padding: EdgeInsets.all(10.0),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Treatment',
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () async {

                                    // saveTask()
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Create')),
                            ],
                          ),
                        ));
                  } //close son builder
                  ); //close showModal
            } //close onPressed
            ));
  } //close parent builder
} //close class
