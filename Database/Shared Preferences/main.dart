import 'package:shared_preferences/shared_preferences.dart';

//! Shared Preferences plugin wraps platform-specific persistent storage
//! for simple data. Data may persisted to disk asynchronously, and there
//! is no guarantee that writes will be persisted to disk after returning,
//! so this plugin must not be used for storing critical data.

//* Supported data types are int, double, bool, String and List<String>

//? Write data
void writeData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('counter', 10);
  await prefs.setBool('repeat', true);
  await prefs.setDouble('decimal', 1.5);
  await prefs.setString('action', 'Start');
  await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
}

//? Read data
void readData() async {
  final prefs = await SharedPreferences.getInstance();
  final int? counter = prefs.getInt('counter');
  final bool? repeat = prefs.getBool('repeat');
  final double? decimal = prefs.getDouble('decimal');
  final String? action = prefs.getString('action');
  final List<String>? items = prefs.getStringList('items');
}

//? Remove an entry
void removeData() async {
  final prefs = await SharedPreferences.getInstance();
  final success = await prefs.remove('counter');
}

//? Testing
void testData() {
  Map<String, Object> values = {'counter': 1};
  SharedPreferences.setMockInitialValues(values);
}
