import 'package:flutter/material.dart';

class TextButtonToggle extends StatefulWidget {
  const TextButtonToggle({super.key});

  @override
  State<TextButtonToggle> createState() => _TextButtonToggleState();
}

class _TextButtonToggleState extends State<TextButtonToggle> {
  bool isEnabled = true; // Initial state of the button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextButton Toggle Example'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            setState(() {
              isEnabled =
                  !isEnabled; // Toggle the state between enabled and disabled
            });
          },
          child: Text(
            isEnabled ? 'Enabled' : 'Disabled', // Show text based on state
            style: TextStyle(
              fontSize: 18,
              color: isEnabled
                  ? Colors.green
                  : Colors.red, // Change text color based on state
            ),
          ),
        ),
      ),
    );
  }
}
