import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animator/pages/home/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        toolbarHeight: 80,
        title: Text("Matching game"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Attempts Left : ${Provider.of<GameProvider>(context).attempts}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      4,
                      (index) => Consumer<GameProvider>(
                        builder: (context, gameProvider, child) {
                          return gameProvider.matchedParts[index]
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Image.asset(
                                    gameProvider.partImages[index]['part']!,
                                    height: 70,
                                    color:
                                        Colors.grey, // Indicate it is matched
                                  ),
                                )
                              : Draggable(
                                  data: gameProvider.partImages[index]['item'],
                                  feedback: Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Image.asset(
                                      gameProvider.partImages[index]['part']!,
                                      height: 70,
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Image.asset(
                                      gameProvider.partImages[index]['part']!,
                                      height: 70,
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      4,
                      (index) => Consumer<GameProvider>(
                        builder: (context, gameProvider, child) {
                          return DragTarget<String>(
                            onAcceptWithDetails: (details) {
                              gameProvider.updateFullImage(
                                details.data.toString(),
                                index,
                                context,
                              );
                            },
                            builder: (context, candidateData, rejectedData) =>
                                Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Image.asset(
                                gameProvider.images[index]['thing']!,
                                height: 70,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
