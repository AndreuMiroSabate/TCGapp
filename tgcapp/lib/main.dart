import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TCGApp());
}

class TCGApp extends StatelessWidget {
  const TCGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage("assets/TCG_Logo.png")),
            ),
            Container(
              height: 30,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(children: [
              Icon(Icons.search, color: Colors.grey[700],),
              const Expanded(child: TextField())
             ]),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: null, child: Text("Filter")),
                ElevatedButton(onPressed: null, child: Text("Sets")),
                ElevatedButton(onPressed: null, child: Text("Favs")),
              ],
              )
          ],
        ),
      ),
    );
  }
}
