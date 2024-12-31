import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  // List of unique colors
  final List<Color> colors = List.generate(
    20,
    (index) =>
        Color((index * 0xFFFFFF ~/ 20) | 0xFF000000), // Generate random colors
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 8.0, // Space between columns
          mainAxisSpacing: 8.0, // Space between rows
          childAspectRatio: 1.0, // Ensures square containers
        ),
        itemCount: 20, // Total 20 containers
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4.0,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        padding: EdgeInsets.all(8.0), // Padding around the grid
      ),
    );
  }
}
