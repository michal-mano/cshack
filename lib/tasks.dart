import 'package:cshack/PersistentTabBar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'utils.dart';
import 'globals.dart';
import 'package:uuid/uuid.dart';
import 'database_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

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
                .map((entry) => TaskCard(
                      entry: entry,
                      id: entry.key,
                    ))
                .toList();
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: textWidgets,
                ),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: const Text(
                  "Loading...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
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
  TextEditingController worthController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void saveTask(treament_title, worth, date) async {
    String new_task_id = const Uuid().v4();
    String family_id = await loadString('family_id');

    DatabaseManager()
        .database
        .ref("groups/$family_id/tasks/$new_task_id")
        .set({"treatment_title": treament_title, "worth": worth, "date": date});
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
                                  TextFormField(
                                    controller: worthController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Strength Coins',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: dateController,
                                    keyboardType: TextInputType.datetime,
                                    decoration: const InputDecoration(
                                      labelText: 'Treatment Date',
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        saveTask(
                                            treatmentController.text,
                                            worthController.text,
                                            dateController.text);
                                        Navigator.pop(context);
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PersistentTabBar()),
                                        );
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
  const TaskCard({super.key, required this.entry, required this.id});

  final dynamic entry;
  final String id;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool is_active = false;
  Color button_color = Colors.blue;

  void _startTask() {
    button_color = Colors.red;
    is_active = true;
  }

  void _stopTask() {}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text(
            '${widget.entry.value["treatment_title"]}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(widget.entry.value["worth"], style: TextStyle(fontSize: 25)),
          Icon(Icons.build_circle),
        ]),
        TimerWidget(id: widget.id, worth: widget.entry.value["worth"]),
      ],
    )));
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.id, required this.worth});

  final String id;
  final String worth;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _isRunning = false;
  Timer? _timer;
  Color button_color = Colors.blue;
  String button_text = "Start";

  void _stopTimer() {
    setState(() {
      DatabaseManager()
          .database
          .ref("groups/$globalFamilyId/tasks/${widget.id}")
          .remove()
          .then((erg) {
        strengthCoins += int.parse(widget.worth);
        DatabaseManager()
            .database
            .ref("groups/$globalFamilyId/tasks/${widget.id}")
            .remove()
            .then((erg) {
          dispose();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PersistentTabBar()),
          );
        });
      });
    });
  }

  void _startTimer() {
    setState(() {
      button_color = Colors.red;
      _isRunning = true;
      button_text = "Complete";
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds < 60) {
          _seconds++;
        } else {
          if (_minutes < 60) {
            _minutes++;
            _seconds = 0;
          } else {
            if (_hours < 24) {
              _hours++;
              _minutes = 0;
              _seconds = 0;
            } else {
              _isRunning = false;
              _timer?.cancel();
            }
          }
        }
      });
    });
  }

  void _cancelTimer() {
    setState(() {
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
      _isRunning = false;
    });
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Display remaining time in HH:MM:SS format
          Container(
            color: Colors.amber,
            child: Center(
              child: Text(
                '${_hours.toString().padLeft(2, '0')}:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: button_color,
              ),
              onPressed: () {
                if (_isRunning) {
                  _stopTimer();
                } else {
                  _startTimer();
                }
              },
              child: Text(button_text))
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
