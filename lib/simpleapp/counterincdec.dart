import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0; // Initial counter value

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--; // Prevent counter from going below 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('-'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    shape: CircleBorder(),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('+'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
