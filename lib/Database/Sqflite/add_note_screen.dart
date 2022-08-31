import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNote extends StatefulWidget {
  AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String formattedDate =
      DateFormat('MMMM d, yyyy  kk:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Note'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextField(),
          Text(formattedDate),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
