import 'package:get/get.dart';

class GameController extends GetxController {
  var board = List<String>.filled(9, '', growable: false)
      .obs; // Pre-fill with empty strings
  var currentPlayer = 'X'.obs;
  var winner = ''.obs;
  var isDraw = false.obs;

  void startTheGame() {
    board.value = List<String>.filled(9, ''); // Reset the board
    currentPlayer.value = 'X';
    winner.value = '';
    isDraw.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    startTheGame();
  }

  bool checkDraw() {
    return board.every((cell) => cell != ''); // Check if all cells are filled
  }

  bool checkWinner(String player) {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == player &&
          board[i * 3 + 1] == player &&
          board[i * 3 + 2] == player) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == player &&
          board[i + 3] == player &&
          board[i + 6] == player) {
        return true;
      }
    }

    // Check diagonals
    if (board[0] == player && board[4] == player && board[8] == player) {
      return true;
    }
    if (board[2] == player && board[4] == player && board[6] == player) {
      return true;
    }

    return false;
  }

  void handleClick(int index) {
    if (board[index] != '' || winner.value != '')
      return; // Ignore if cell is filled or game is over
    board[index] = currentPlayer.value;
    if (checkWinner(currentPlayer.value)) {
      winner.value = currentPlayer.value;
    } else if (checkDraw()) {
      isDraw.value = true;
    } else {
      currentPlayer.value =
          currentPlayer.value == 'X' ? 'O' : 'X'; // Switch player
    }
  }
}
