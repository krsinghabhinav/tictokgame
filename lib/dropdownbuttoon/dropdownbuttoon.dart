import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropValue = 'one'; // Initial value for the dropdown
  List<String> listdata = ['one', 'two', 'three', 'four', 'five', 'six'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Button Example'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: dropValue,
          items: listdata.map<DropdownMenuItem<String>>((String element) {
            return DropdownMenuItem<String>(
              value: element,
              child: Text(element),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              dropValue = value!;
            });
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DropdownButtonExample(),
  ));
}
