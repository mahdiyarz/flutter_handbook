import 'package:flutter/material.dart';
import 'package:flutter_handbook/Database/Sqflite/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'db_helper.dart';
import 'add_note_screen.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  late List<NoteModel> notes;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshAllNotes();
  }

  @override
  void dispose() {
    DBHelper.instance.close();
    // TODO: implement dispose
    super.dispose();
  }

  Future refreshAllNotes() async {
    setState(() {
      isLoading = true;
    });
    notes = await DBHelper.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Notes'),
        centerTitle: true,
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : notes.isEmpty
              ? Center(
                  child: Text('There is no notes!'),
                )
              : Container(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (Context) {
            return AddNote();
          }));

          refreshAllNotes();
        },
      ),
    );
  }

  Widget Notes() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return Column();
      },
      itemCount: notes.length,
    );
  }
}
