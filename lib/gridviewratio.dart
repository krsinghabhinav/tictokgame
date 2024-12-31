import 'package:flutter/material.dart';

class AlternatingGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alternating Aspect Ratio Grid'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 20, // Total number of items
        itemBuilder: (context, index) {
          // Alternate between 1:1 and 2:1 aspect ratio
          final isSquare = index % 2 == 0;

          return LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = isSquare ? width : width / 2; // Adjust height
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
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
                    'Item ${index + 1}\n${isSquare ? "1:1" : "2:1"}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
