import 'package:flutter/material.dart';

class DropdownButtonExa extends StatefulWidget {
  const DropdownButtonExa({super.key});

  @override
  State<DropdownButtonExa> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExa> {
  String selectedItem = 'Item 1'; // Default selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropdownButton with Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue!;
                });

                // Show Snackbar when an item is selected
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected: $selectedItem'),
                  ),
                );
              },
              items: <String>['Item 1', 'Item 2', 'Item 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
