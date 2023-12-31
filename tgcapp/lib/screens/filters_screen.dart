import 'package:flutter/material.dart';
import 'package:tgcapp/modules/filters_value.dart';
import 'package:tgcapp/widgets/filters_list.dart';
import 'package:tgcapp/widgets/functions_class.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key});

  List<String> pathList = [
    "https://api.pokemontcg.io/v2/types",
    "https://api.pokemontcg.io/v2/subtypes",
    "https://api.pokemontcg.io/v2/supertypes",
    "https://api.pokemontcg.io/v2/rarities",
    "https://api.pokemontcg.io/v2/sets"
  ];

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 101, 141),
      body: SafeArea(
        child: Stack(fit: StackFit.expand, children: [
          const Image(
              image: AssetImage("assets/background_pokeball.png"),
              fit: BoxFit.cover),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cPath = ClassPath(getArandomPath());
                        Navigator.of(context).pushNamed("/");
                      });
                    },
                    child: const Icon(Icons.house_sharp, size: 20),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 60, 101, 141),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: const Color.fromARGB(255, 216, 182, 17),
                        width: 7,
                      ),
                    ),
                    child: Column(children: [
                      FiltersList(path: widget.pathList[0], title: "Type"),
                      FiltersList(path: widget.pathList[1], title: "Subtype"),
                      FiltersList(path: widget.pathList[2], title: "Supertype"),
                      FiltersList(path: widget.pathList[3], title: "Rarity"),
                    ])),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Set transparent background color
                      foregroundColor: Colors.black, // Set text color
                    ),
                    onPressed: () {
                      setState(() {
                        cPath.path = "https://api.pokemontcg.io/v2/cards?q="
                            "${type == '' ? '' : 'types:$type '}"
                            "${subtype == '' ? '' : 'subtypes:${subtype.replaceAll(" ", "&")} '}"
                            "${supertype == '' ? '' : 'supertype:$supertype '}"
                            "${rarity == '' ? '' : 'rarity:${rarity.replaceAll(" ", "&")} '}";
                        Navigator.of(context).pushNamed("/results");
                      });
                    },
                    child: const Image(
                        image:
                            AssetImage("assets/cartoon-pokeball-sticker.png"),
                        height: 75),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
