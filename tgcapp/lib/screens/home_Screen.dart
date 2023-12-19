import 'package:flutter/material.dart';
import 'package:tgcapp/widgets/functions_class.dart';
import 'package:tgcapp/widgets/pcard_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        const Image(
          image: AssetImage("assets/Projecte nou.png"),
          fit: BoxFit.cover,
        ),
        Column(children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage("assets/TCG_Logo.png"),
            ),
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Icon(
                Icons.search,
                color: Colors.grey[700],
              ),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    cPath.path =
                        "https://api.pokemontcg.io/v2/cards?q=name:*$value*";
                    Navigator.of(context).pushNamed("/results");
                  },
                  decoration: const InputDecoration(
                    hintText: "Search a pokemon here",
                  ),
                ),
              ),
            ]),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/filters");
                },
                child: const Text("Filter"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/sets");
                  },
                  child: const Text("Sets")),
              const ElevatedButton(onPressed: null, child: Text("Favs")),
            ],
          ),
          Expanded(
            child: PCardList(path: cPath.path),
          ),
        ]),
      ]),
    );
  }
}
