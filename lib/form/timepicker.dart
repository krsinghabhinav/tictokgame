import 'package:flutter/material.dart';

class TimePickerDemo extends StatefulWidget {
  @override
  _TimePickerDemoState createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  // Initialize selectedTime with the current time
  TimeOfDay selectedTime = TimeOfDay.now();

  // Method to invoke the TimePicker and update the selectedTime
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          selectedTime, // Use the current selected time as the starting point
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Time Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the selected time
            Text(
              "Selected Time: ${selectedTime.format(context)}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Select a time'),
            ),
          ],
        ),
      ),
    );
  }
}
