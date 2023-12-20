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
  ];

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        const Image(
            image: AssetImage("assets/Projecte nou.png"), fit: BoxFit.cover),
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
                  child: const Icon(Icons.arrow_back, size: 20),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 57, 88, 151),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 216, 182, 17),
                      width: 7
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
                  child: const Icon(Icons.search, size: 50),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
