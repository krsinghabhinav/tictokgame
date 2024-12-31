import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  // List of available interests
  List<String> interests = [
    'Reading',
    'Music',
    'Travel',
    'Sports',
    'Cooking',
  ];

  // List of selected interests
  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Demo'),
      ),
      body: ListView(
        children: interests.map((interest) {
          return CheckboxListTile(
            title: Text(interest),
            value: selectedInterests
                .contains(interest), // Check if the interest is selected
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  // Add the interest to the list if selected
                  selectedInterests.add(interest);
                } else {
                  // Remove the interest if deselected
                  selectedInterests.remove(interest);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
