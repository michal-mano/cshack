import 'package:firebase_database/firebase_database.dart';
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
  Future<Object?> fetchTasks() async {
    String family_id = await loadString('family_id');
    var data =
        await DatabaseManager().database.ref("groups/$family_id/tasks/").get();
    print("received data: $data");
    return data.value;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchTasks(),
        builder: (context, AsyncSnapshot<Object?> snapshot) {
          if (snapshot.hasData) {
            Map<dynamic, dynamic> data = snapshot.data as Map<dynamic, dynamic>;
            List<Widget> textWidgets = data.entries
                .map((entry) => TaskCard(entry: entry))
                .toList();
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: textWidgets,
              ),
            );
          } else {
            return const Text(
              "NO DATA",
              textAlign: TextAlign.center,
            );
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
        appBar: MyAppBar(widget.title),
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

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.entry});
  final dynamic entry;

  @override
  State<TaskCard> createState() => _TaskCardState();

}

class _TaskCardState extends State<TaskCard> {
  bool is_active= false;
  Color button_color = Colors.blue;
  void _startTask()
  {
  button_color = Colors.red;
  is_active = true;
  }
  void _stopTask(){

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              title: Text('${widget.entry.value["treatment_title"]}'),
            ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: button_color,
              )
              onPressed: (){
                if (is_active) {
                  _stopTask();
                } else {
                  _startTask();
                }
              },
              child: Text("Start"))
          ],
        )
      )
    );
  }
}