import 'package:flutter/material.dart';
import 'package:tictokgame/animation/CustomAnimatedBut.dart';

class Animatinbutton extends StatefulWidget {
  const Animatinbutton({super.key});

  @override
  State<Animatinbutton> createState() => _AnimatinbuttonState();
}

class _AnimatinbuttonState extends State<Animatinbutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Button')),
      body: Center(
        child: CustomAnimatedButton(
          text: "Press Me",
          onPressed: () {
            print("Button Pressed");
          },
        ),
      ),
    );
  }
}
