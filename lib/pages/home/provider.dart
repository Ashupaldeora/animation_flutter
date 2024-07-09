import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  String fullOrange = "assets/images/full-orange.png";
  String fullCotton = "assets/images/full-cotton.png";
  String fullCake = "assets/images/full-cake.png";
  String fullFruit = "assets/images/full-fruit.png";

  List<Map<String, String>> images = [
    {'thing': "assets/images/half-orange.png", 'item': "orange"},
    {'thing': "assets/images/half-fruit.png", 'item': "fruit"},
    {'thing': "assets/images/half-cotton.png", 'item': "cotton"},
    {'thing': "assets/images/half-cake.png", 'item': "cake"},
  ];

  List<Map<String, String>> partImages = [
    {'part': "assets/images/part-cake.png", 'item': "cake"},
    {'part': "assets/images/part-orange.png", 'item': "orange"},
    {'part': "assets/images/part-fruit.png", 'item': "fruit"},
    {'part': "assets/images/part-cotton.png", 'item': "cotton"},
  ];

  List<bool> matchedParts = [false, false, false, false];

  int attempts = 3;

  void updateFullImage(String item, int index, BuildContext context) {
    if (images[index]['item'] == item) {
      if (item == "orange") {
        images[index]['thing'] = fullOrange;
      } else if (item == "cake") {
        images[index]['thing'] = fullCake;
      } else if (item == "fruit") {
        images[index]['thing'] = fullFruit;
      } else {
        images[index]['thing'] = fullCotton;
      }
      int partIndex =
          partImages.indexWhere((element) => element['item'] == item);
      if (partIndex != -1) {
        matchedParts[partIndex] = true;
      }

      if (matchedParts.every((element) => element)) {
        showWinDialog(context);
      }
    } else {
      attempts--;
      if (attempts == 0) {
        showGameOverDialog(context);
      }
    }
    notifyListeners();
  }

  void showGameOverDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text("You've run out of attempts. Try again?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: Text("Retry"),
            ),
          ],
        );
      },
    );
  }

  void showWinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Congratulations!"),
          content: Text("You won the game!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: Text("Play Again"),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    attempts = 3;
    images = [
      {'thing': "assets/images/half-orange.png", 'item': "orange"},
      {'thing': "assets/images/half-fruit.png", 'item': "fruit"},
      {'thing': "assets/images/half-cotton.png", 'item': "cotton"},
      {'thing': "assets/images/half-cake.png", 'item': "cake"},
    ];
    matchedParts = [false, false, false, false];
    notifyListeners();
  }
}
