import 'package:flutter/material.dart';

import 'package:tictokgame/shareprefrancetest/categor/database_helper.dart';
import 'package:tictokgame/shareprefrancetest/categor/note.dart';

import 'category.dart';

class CategoryHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryHomeScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Category> _categories = [];
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    List<Category> categories = await _databaseHelper.getCategories();
    setState(() {
      _categories = categories;
    });
  }

  _loadNotes(String category) async {
    List<Note> notes = await _databaseHelper.getNotesByCategory(category);
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes App')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_categories[index].name),
                  onTap: () {
                    _loadNotes(_categories[index].name);
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => NotesList(notes: _notes),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Add category and notes logic here
              Category newCategory = Category(name: "Work");
              await _databaseHelper.insertCategory(newCategory);
              _loadCategories();
            },
            child: Text('Add Category'),
          ),
        ],
      ),
    );
  }
}

class NotesList extends StatelessWidget {
  final List<Note> notes;

  NotesList({required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notes[index].title),
          subtitle: Text(notes[index].description),
        );
      },
    );
  }
}
