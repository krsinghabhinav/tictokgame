import 'package:flutter/material.dart';

class NestedListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nested ListView Example'),
      ),
      body: ListView.builder(
        itemCount: 3, // Outer ListView has 3 items
        itemBuilder: (context, outerIndex) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outer List Item ${outerIndex + 1}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  // Inner ListView
                  ListView.builder(
                    itemCount: 5, // Inner ListView has 5 items
                    shrinkWrap:
                        true, // Allows the inner ListView to expand within the outer ListView
                    physics:
                        NeverScrollableScrollPhysics(), // Disables scrolling for inner ListView
                    itemBuilder: (context, innerIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text('Inner List Item ${innerIndex + 1}'),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
