import 'package:flutter/material.dart';

class GridViewWithDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid with Alert Dialog'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 20, // Number of items in the grid
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showItemDialog(context, index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.primaries[index % Colors.primaries.length],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Item ${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showItemDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Details'),
          content: Text('You tapped on Item ${index + 1}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
