import 'package:animator/utils/image_list.dart';
import 'package:flutter/material.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                        4,
                        (index) => Draggable(
                              data: partImages[index],
                              feedback: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Image.asset(
                                  partImages[index],
                                  height: 70,
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Image.asset(
                                  partImages[index],
                                  height: 70,
                                ),
                              ),
                            ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                        4,
                        (index) => DragTarget(
                              onAcceptWithDetails: (details) {},
                              builder: (context, candidateData, rejectedData) =>
                                  Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Image.asset(
                                  images[index],
                                  height: 70,
                                ),
                              ),
                            ))
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
