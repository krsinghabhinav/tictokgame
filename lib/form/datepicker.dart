import 'package:flutter/material.dart';

class BirthdayPickerDemo extends StatefulWidget {
  @override
  _BirthdayPickerDemoState createState() => _BirthdayPickerDemoState();
}

class _BirthdayPickerDemoState extends State<BirthdayPickerDemo> {
  // Initialize selectedDate with the current date
  DateTime selectedDate = DateTime.now();

  // Method to invoke the DatePicker and update the selectedDate
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          selectedDate, // Use the current selected date as the starting point
      firstDate: DateTime(1900), // Earliest allowable birthday
      lastDate: DateTime.now(), // Latest allowable birthday (today)
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ensure "Selected Birthday:" label is correctly shown before the date
            Text(
              "Selected Birthday: ${selectedDate.toLocal().toString().split(' ')[0]}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select your birthday'),
            ),
          ],
        ),
      ),
    );
  }
}
