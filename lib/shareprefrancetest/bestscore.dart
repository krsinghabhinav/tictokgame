import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreTrackerScreen extends StatefulWidget {
  const ScoreTrackerScreen({super.key});

  @override
  State<ScoreTrackerScreen> createState() => _ScoreTrackerScreenState();
}

class _ScoreTrackerScreenState extends State<ScoreTrackerScreen> {
  final TextEditingController scoreController = TextEditingController();
  List<int> highScores = [];

  @override
  void initState() {
    super.initState();
    loadHighScores();
  }

  /// Load high scores from Shared Preferences
  Future<void> loadHighScores() async {
    final prefs = await SharedPreferences.getInstance();
    final scoresString = prefs.getString('highScores');
    if (scoresString != null) {
      setState(() {
        highScores = List<int>.from(json.decode(scoresString));
      });
    }
  }

  /// Save high scores to Shared Preferences
  Future<void> saveHighScores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('highScores', json.encode(highScores));
  }

  /// Add a new score and update the high scores list
  void addScore() {
    final scoreText = scoreController.text;
    if (scoreText.isNotEmpty) {
      final score = int.tryParse(scoreText);
      if (score != null) {
        setState(() {
          highScores.add(score);
          highScores.sort((a, b) => b.compareTo(a)); // Sort descending
          if (highScores.length > 10) {
            highScores.removeLast(); // Keep only top 5
          }
        });
        saveHighScores();
        scoreController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid number!')),
        );
      }
    }
  }

  /// Reset all high scores
  void resetScores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('highScores');
    setState(() {
      highScores.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Score Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetScores,
            tooltip: 'Reset Scores',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add a New Score:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: scoreController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter Score',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: addScore,
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Top 5 High Scores:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: highScores.isEmpty
                  ? const Center(
                      child: Text('No scores yet. Add your first score!'),
                    )
                  : ListView.builder(
                      itemCount: highScores.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text('Score: ${highScores[index]}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
