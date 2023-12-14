
import 'package:flutter/material.dart';
import 'package:tgcapp/main.dart';
import 'package:tgcapp/widgets/pcard_list.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.path, required this.tcgapp});

  String path;

  TCGApp tcgapp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
            Icon(
              Icons.search,
              color: Colors.grey[700],
            ),
            const Expanded(child: TextField())
          ]),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: null, child: Text("Filter")),
            ElevatedButton(onPressed: (){Navigator.of(context).pushNamed("/sets");}, child: Text("Sets")),
            ElevatedButton(onPressed: null, child: Text("Favs")),
          ],
        ),
        Expanded(
          child: PCardList(path: tcgapp.getArandomPath()),
        ),
      ]),
    );
  }
}

