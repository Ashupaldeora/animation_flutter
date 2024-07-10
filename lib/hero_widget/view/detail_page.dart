import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
    return Hero(
      tag: "todo",
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.grey,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              IconButton.outlined(
                  onPressed: () {},
                  icon: Icon(
                    Icons.access_alarm,
                    color: Color(0xffE67169),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "8 Tasks",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Custom",
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: LinearProgressIndicator(
                      value: 0.8,
                      color: Color(0xffE67169),
                    ),
                  ),
                  Text(
                    "80%",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 5),
                  // color: Colors.yellow,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Checkbox(
                        fillColor: MaterialStatePropertyAll(Color(0xffE67169)),
                        value: true,
                        onChanged: (value) {},
                      ),
                      Spacer(),
                      Text(
                        "Meet clients",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.access_alarm))
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
