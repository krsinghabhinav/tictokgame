import 'package:flutter/material.dart';
import 'package:tictokgame/shareprefrancetest/fitness/fitness_database_service.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<Map<String, dynamic>> _steps = [];
  List<Map<String, dynamic>> _exercises = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = fitnessDatabaseService();
    final steps = await db.getSteps();
    final exercises = await db.getExercises();

    setState(() {
      _steps = steps;
      _exercises = exercises;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress')),
      body: ListView(
        children: [
          Text('Steps:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ..._steps.map((entry) => ListTile(
                title: Text('${entry['date']}'),
                subtitle: Text('Steps: ${entry['steps']}'),
              )),
          Divider(),
          Text('Exercises:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ..._exercises.map((entry) => ListTile(
                title: Text('${entry['date']}'),
                subtitle:
                    Text('${entry['exercise']} - ${entry['duration']} min'),
              )),
        ],
      ),
    );
  }
}
