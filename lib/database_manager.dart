import 'package:firebase_database/firebase_database.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._();
  late FirebaseDatabase _database;

  DatabaseManager._() {
    _database = FirebaseDatabase(
        databaseURL:
        "https://project-team-whatsapp-default-rtdb.europe-west1.firebasedatabase.app");
  }

  factory DatabaseManager() {
    return _instance;
  }

  FirebaseDatabase get database => _database;
}

