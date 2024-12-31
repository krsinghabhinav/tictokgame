import 'package:flutter/material.dart';

class ButtonTestOne extends StatefulWidget {
  const ButtonTestOne({super.key});

  @override
  State<ButtonTestOne> createState() => _ButtonTestOneState();
}

class _ButtonTestOneState extends State<ButtonTestOne> {
  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Test'),
      ),
      body: MaterialButton(
        onPressed: () {
          setState(() {
            istrue = !istrue;
          });
        },
        color: istrue ? Colors.red : const Color.fromARGB(255, 39, 172, 34),
        child: Text('click'),
      ),
    );
  }
}
