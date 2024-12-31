import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'note.dart';

class NoteScreen extends StatelessWidget {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final String? category;

  NoteScreen({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Note')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                final newNote = Note(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  category: category ?? 'General',
                );
                _databaseHelper.insertNote(newNote);
                Navigator.pop(context);
              },
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
