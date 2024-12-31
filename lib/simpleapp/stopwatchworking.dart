import 'dart:async';

import 'package:flutter/material.dart';

class Stopwatchworking extends StatefulWidget {
  const Stopwatchworking({super.key});

  @override
  State<Stopwatchworking> createState() => _StopwatchworkingState();
}

class _StopwatchworkingState extends State<Stopwatchworking> {
  late Timer timer;
  Duration elapsed = Duration.zero;
  bool isRunning = false;

  void startclock() {
    if (!isRunning) {
      timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          elapsed = elapsed + Duration(milliseconds: 100);
        });
      });

      setState(() {
        isRunning = true;
      });
    }
  }

  void stopclock() {
    if (isRunning) {
      timer.cancel();
      setState(() {
        isRunning = false;
      });
    }
  }

  void resetclock() {
    if (isRunning) {
      timer.cancel();
      setState(() {
        elapsed = Duration.zero;
        isRunning = false;
      });
    }
  }

  String formatetime(Duration duration) {
    String twoDigites(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigites(duration.inHours);
    final minutes = twoDigites(duration.inMinutes.remainder(60));
    final seconds = twoDigites(duration.inSeconds.remainder(60));
    final milliseconds =
        twoDigites(duration.inMilliseconds % 1000 ~/ 100).toString();
    return '$hours:$minutes:$seconds:$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatch'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            border: Border.all(color: Colors.blue, width: 5),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              formatetime(elapsed),
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isRunning ? null : startclock();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Icon(Icons.play_arrow),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isRunning ? stopclock() : null;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Icon(Icons.pause),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isRunning ? resetclock() : null;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Icon(Icons.refresh, color: Colors.white, size: 32),
            ),
          ],
        )
      ]),
    );
  }
}
