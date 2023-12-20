import 'package:flutter/material.dart';
import 'package:tgcapp/widgets/functions_class.dart';
import 'package:tgcapp/widgets/pcard_list.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 101, 141),
      body: SafeArea(
        child: Stack(fit: StackFit.expand, children: [
          const Image(
            image: AssetImage("assets/background_pokeball.png"),
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: const Icon(Icons.arrow_back, size: 20),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pushNamed("/filters");
                        });
                      },
                      child: const Icon(Icons.format_list_bulleted_rounded,
                          size: 20),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 40, bottom: 30),
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
                Expanded(child: PCardList(path: cPath.path))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
