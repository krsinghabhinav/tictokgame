import 'package:flutter/material.dart';

class Responsicelayout extends StatefulWidget {
  const Responsicelayout({super.key});

  @override
  State<Responsicelayout> createState() => _ResponsicelayoutState();
}

class _ResponsicelayoutState extends State<Responsicelayout> {
  final List<Map<String, String>> data = [
    {'Name': 'John Doe', 'Age': '25', 'Occupation': 'Software Developer'},
    {'Name': 'Jane Smith', 'Age': '30', 'Occupation': 'Designer'},
    {'Name': 'Sam Brown', 'Age': '22', 'Occupation': 'Product Manager'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // If the screen width is small, use ListView, otherwise use Table
          if (constraints.maxWidth < 600) {
            return buildListLayout(data);
          } else {
            return buildTableLayout(data);
          }
        },
      ),
    );
  }

  Widget buildTableLayout(List<Map<String, String>> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: Colors.black),
        columnWidths: {
          0: FlexColumnWidth(100.0),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(120.0),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.blue.shade100),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Name'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Age'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Occupation'),
              ),
            ],
          ),
          for (var row in data)
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(row['Name']!),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(row['Age']!),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(row['Occupation']!),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildListLayout(List<Map<String, String>> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: ListTile(
            title: Text(data[index]['Name']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Age: ${data[index]['Age']}'),
                Text('Occupation: ${data[index]['Occupation']}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
