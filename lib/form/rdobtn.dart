import 'package:flutter/material.dart';

enum Difficulty {
  easy("Easy"),
  medium("Medium"),
  hard("Hard");

  // Members
  final String text;
  const Difficulty(this.text);
}

class DifficultySelectionWidget extends StatefulWidget {
  @override
  _DifficultySelectionWidgetState createState() =>
      _DifficultySelectionWidgetState();
}

class _DifficultySelectionWidgetState extends State<DifficultySelectionWidget> {
  Difficulty? _selectedDifficulty = Difficulty.easy; // Default to easy

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Difficulty'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: Difficulty.values
              .map((option) => RadioListTile<Difficulty>(
                    title: Text(option.text),
                    value: option,
                    groupValue: _selectedDifficulty,
                    onChanged: (Difficulty? value) {
                      setState(() {
                        _selectedDifficulty = value;
                      });
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
