import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> loadString(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '';
}

const String USER_TYPE_CHILD = "Child";
const String USER_TYPE_PARENT = "Parent";
