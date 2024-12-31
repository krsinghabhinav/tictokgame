import 'package:flutter/material.dart';

class Startnamewitha extends StatefulWidget {
  const Startnamewitha({super.key});

  @override
  State<Startnamewitha> createState() => _StartnamewithaState();
}

class _StartnamewithaState extends State<Startnamewitha> {
  final List<String> names = [
    'Alice',
    'Bob',
    'Amelia',
    'David',
    'Angela',
    'Eve',
    'Arthur',
    'Grace',
    'Aaron',
    'John',
    'Alex',
    'Sophia',
    'Albert',
    'Rachel',
    'Andrew',
    'Tom',
    'Alice',
    'Charlie',
    'Anna',
    'James'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start with a name'),
      ),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            bool startwithA = names[index].startsWith('A');
            return ListTile(
                title: startwithA
                    ? Text(
                        '${names[index]}',
                        style: TextStyle(color: Colors.green),
                      )
                    : Text(
                        '${names[index]}',
                        style: TextStyle(color: Colors.red),
                      ));
          }),
    );
  }
}
