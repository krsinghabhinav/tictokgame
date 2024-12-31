import 'package:flutter/material.dart';

class CombinedDateTimePickerDemo extends StatefulWidget {
  @override
  _CombinedDateTimePickerDemoState createState() =>
      _CombinedDateTimePickerDemoState();
}

class _CombinedDateTimePickerDemoState
    extends State<CombinedDateTimePickerDemo> {
  // Initialize selectedDateTime with the current date and time
  DateTime? selectedDateTime;

  // Method to invoke the combined DatePicker and TimePicker and update the selectedDateTime
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Use the current date as the starting point
      firstDate: DateTime(1900), // Earliest allowable date
      lastDate: DateTime.now(), // Latest allowable date
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay.now(), // Use the current time as the starting point
      );
      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combined DateTime Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the selected date and time
            Text(
              "Selected DateTime: ${selectedDateTime != null ? '${selectedDateTime!.toLocal()}' : 'None selected'}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDateTime(context),
              child: const Text('Select date and time'),
            ),
          ],
        ),
      ),
    );
  }
}
