import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  late Timer _timer;
  Duration _elapsed = Duration.zero;
  bool _isRunning = false;

  void _startTimer() {
    if (!_isRunning) {
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          _elapsed += Duration(milliseconds: 100);
        });
      });
      setState(() {
        _isRunning = true;
      });
    }
  }

  void _stopTimer() {
    if (_isRunning) {
      _timer.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resetTimer() {
    if (_isRunning) _timer.cancel();
    setState(() {
      _elapsed = Duration.zero;
      _isRunning = false;
    });
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final milliseconds = (duration.inMilliseconds % 1000 ~/ 100).toString();
    return "$hours:$minutes:$seconds.$milliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 4),
              ),
              child: Center(
                child: Text(
                  _formatTime(_elapsed),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _startTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(Icons.play_arrow, color: Colors.white, size: 32),
                ),
                ElevatedButton(
                  onPressed: _isRunning ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(Icons.pause, color: Colors.white, size: 32),
                ),
                ElevatedButton(
                  onPressed: _resetTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(Icons.refresh, color: Colors.white, size: 32),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
