import 'package:hive/hive.dart';

class DBHelper {
//? refrence our box
  final _myBox = Hive.box('users');

//? write data
  void writeData(String userName, int phoneNumber) {
    _myBox.put(userName, {'userName': userName, 'phoneNumber': '$phoneNumber'});
  }

//? read data
  Future<bool> readData(String userName) async {
    final isUser = await _myBox.get(userName);
    return isUser;
  }
}


// //? delete data
//   void deleteData(int key) {
//     _myBox.delete(key);
//   }


// Future<BoxCollection> get dbCollection async {
  //   final collection = await BoxCollection.open(
  //     'UserInformation', //? Name of database
  //     {'userNames'}, //? Name of boxes
  //     path: './', //? Path where to store boxes
  //   );
    
    
  //   return collection;
  // }

  // Future writeData(String userName, int phoneNumber) async {
  //   final usersBox = await instance.dbCollection
  //     ..openBox<Map>('userNames');
  // }













// import 'package:hive/hive.dart';

// //? refrence our box
// final _myBox = Hive.box('myBox');

// //? write data
// void writeData(int key, String note) {
//   _myBox.put(key, note);
// }

// //? read data
// void readData(int key) {
//   print(_myBox.get(key));
// }

// //? delete data
// void deleteData(int key) {
//   _myBox.delete(key);
// }



