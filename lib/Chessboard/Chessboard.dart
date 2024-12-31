import 'package:flutter/material.dart';

class Chessboard extends StatefulWidget {
  const Chessboard({super.key});

  @override
  State<Chessboard> createState() => _ChessboardState();
}

class _ChessboardState extends State<Chessboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemCount: 64,
        itemBuilder: (context, index) {
          int row = index ~/ 8;
          int col = index % 8;

          bool iswhite = (row + col) % 2 == 0;
          return Container(
            height: 100,
            width: 100,
            color: iswhite ? Colors.white : Colors.black,
          );
        },
      ),
    );
  }
}
