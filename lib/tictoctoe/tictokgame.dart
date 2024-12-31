import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/gamecontroller.dart';

class Tictokgame extends StatelessWidget {
  final GameController gameController = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic-Tac-Toe'),
      ),
      body: Column(
        children: [
          // Display the current player or game status dynamically
          Obx(
            () => Center(
              child: Text(
                gameController.winner.value != ''
                    ? 'Winner: ${gameController.winner.value}'
                    : gameController.isDraw.value
                        ? "Game is Draw"
                        : "Current Player: ${gameController.currentPlayer.value}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          // Game board
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    gameController.handleClick(index);
                  },
                  child: Obx(() => Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            gameController.board[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                );
              },
            ),
          ),
          // Restart button
          MaterialButton(
            color: Colors.blue,
            child: const Text(
              'Restart Game',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              gameController.startTheGame();
            },
          ),
        ],
      ),
    );
  }
}
