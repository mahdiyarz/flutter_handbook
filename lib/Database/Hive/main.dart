import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

void main() async {
  //? initalize hive
  var path = Directory.current.path;
  await Hive
    ..init(path);

  //? open the box
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
