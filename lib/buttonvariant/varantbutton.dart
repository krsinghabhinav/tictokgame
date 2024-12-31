import 'package:flutter/material.dart';

class ButtonShowcaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Elevated Button',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Elevated Button Pressed')),
                );
              },
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Text Button',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Text Button Pressed'),
                    content: const Text('You clicked the Text Button!'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Outlined Button',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Outlined Button Pressed');
              },
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Icon Button',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Icon Button Pressed')),
                );
              },
              icon: const Icon(Icons.thumb_up),
              color: Colors.blue,
              tooltip: 'Like',
            ),
            const SizedBox(height: 16),
            const Text(
              'Floating Action Button',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
              onPressed: () {
                debugPrint('Floating Action Button Pressed');
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            const Text(
              'Custom Styled Button',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Custom Styled Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Main Floating Action Button Pressed');
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
