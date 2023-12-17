import 'package:flutter/material.dart';
import 'package:tgcapp/modules/filters_value.dart';
import 'package:tgcapp/widgets/filters_list.dart';
import 'package:tgcapp/widgets/functions_class.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key});

  List<String> pathList = ["https://api.pokemontcg.io/v2/types",
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
      body: Column(children: [
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
        FiltersList(path: widget.pathList[0], title: "Type"),
        FiltersList(path: widget.pathList[1], title: "Subtype"),
        FiltersList(path: widget.pathList[2], title: "Supertype"),
        FiltersList(path: widget.pathList[3], title: "Rarity"),

        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                cPath.path =
                      "https://api.pokemontcg.io/v2/cards?q="
                      "${type == ''?'': 'types:$type '}"
                      "${subtype == ''?'': 'subtypes:$subtype '}"
                      "${supertype == ''?'': 'supertype:$supertype '}"
                      "${rarity == ''?'': 'rarity:$rarity '}";
                  Navigator.of(context).pushNamed("/results");
              });
            },
            child: const Icon(Icons.search, size: 50),
          ),
        ),    
      ],
      ),
    );
  }
}
