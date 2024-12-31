import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'fitness_database_service.dart';

class ExerciseLogScreen extends StatefulWidget {
  @override
  _ExerciseLogScreenState createState() => _ExerciseLogScreenState();
}

class _ExerciseLogScreenState extends State<ExerciseLogScreen> {
  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  Future<void> _saveExercise() async {
    final db = fitnessDatabaseService();
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final exercise = _exerciseController.text;
    final duration = int.tryParse(_durationController.text) ?? 0;

    await db.insertExercise(date, exercise, duration);

    _exerciseController.clear();
    _durationController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Exercise logged!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log Exercise')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _exerciseController,
              decoration: InputDecoration(labelText: 'Exercise'),
            ),
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Duration (minutes)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveExercise,
              child: Text('Log Exercise'),
            ),
          ],
        ),
      ),
    );
  }
}
