import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';

import 'fitness_database_service.dart';

class StepTrackerScreen extends StatefulWidget {
  @override
  _StepTrackerScreenState createState() => _StepTrackerScreenState();
}

class _StepTrackerScreenState extends State<StepTrackerScreen> {
  late Stream<StepCount> _stepCountStream;
  int _stepsToday = 0;

  @override
  void initState() {
    super.initState();
    _initStepTracking();
    _loadStepsForToday();
  }

  void _initStepTracking() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen((event) {
      setState(() {
        _stepsToday = event.steps;
      });
      _saveStepsToDatabase(event.steps);
    }).onError((error) {
      print("Step count error: $error");
    });
  }

  Future<void> _loadStepsForToday() async {
    final db = fitnessDatabaseService();
    final steps = await db.getSteps();
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final todaySteps = steps.firstWhere(
      (entry) => entry['date'] == today,
      orElse: () => {'steps': 0},
    );
    setState(() {
      _stepsToday = todaySteps['steps'] as int;
    });
  }

  Future<void> _saveStepsToDatabase(int steps) async {
    final db = fitnessDatabaseService();
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    await db.insertSteps(today, steps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step Tracker')),
      body: Center(
        child: Text(
          'Steps Today: $_stepsToday',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
