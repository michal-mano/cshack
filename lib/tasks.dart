import 'package:flutter/material.dart';
import 'utils.dart';
import 'globals.dart';
import 'package:uuid/uuid.dart';
import 'database_manager.dart';
import 'package:firebase_core/firebase_core.dart';

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
        body: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('Next'),
          ),
        ),
        floatingActionButton: globalUserType != USER_TYPE_PARENT
            ? null
            : FloatingActionButton(
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
