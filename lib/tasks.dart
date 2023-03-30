import 'package:flutter/material.dart';
import 'utils.dart';
import 'globals.dart';
import 'package:uuid/uuid.dart';
import 'database_manager.dart';
import 'package:firebase_core/firebase_core.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Future<String> fetchTasks() async {
    String family_id = await loadString('family_id');
    var data = DatabaseManager().database.ref("groups/$family_id/tasks/").get();
    print("received data: $data");
    await Future.delayed(const Duration(seconds: 2));
    return 'Hello, World!';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchTasks(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Text("text");
          } else {
            return Text("Data received!");
          }
        });
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.title});

  final String title;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController treatmentController = TextEditingController();

  void saveTask(treament_title) async {
    String new_task_id = const Uuid().v4();
    String family_id = await loadString('family_id');

    DatabaseManager().database.ref("groups/$family_id/tasks/$new_task_id").set({
      "treatment_title": treament_title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const TaskList(),
        floatingActionButton: globalUserType != USER_TYPE_PARENT
            ? null
            : FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: treatmentController,
                                    decoration: const InputDecoration(
                                      labelText: 'Treatment',
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        saveTask(treatmentController.text);
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
