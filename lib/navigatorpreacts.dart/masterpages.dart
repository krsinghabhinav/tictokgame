import 'package:flutter/material.dart';

class MasterPage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'title': 'Item 1', 'description': 'This is the description for Item 1'},
    {'title': 'Item 2', 'description': 'This is the description for Item 2'},
    {'title': 'Item 3', 'description': 'This is the description for Item 3'},
    {'title': 'Item 4', 'description': 'This is the description for Item 4'},
    {'title': 'Item 5', 'description': 'This is the description for Item 5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master Page'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.info),
            title: Text(items[index]['title']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: items[index],
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> item =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              item['description']!,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
