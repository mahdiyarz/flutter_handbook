import 'package:hive/hive.dart';

//* refrence our box
final _myBox = Hive.box('myBox');

//* write data
void writeData(int key, String note) {
  _myBox.put(key, note);
}

//* read data
void readData(int key) {
  print(_myBox.get(key));
}

//*delete data
void deleteData(int key) {
  _myBox.delete(key);
}
