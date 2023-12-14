

import 'package:flutter/material.dart';
import 'package:tgcapp/widgets/pset_list.dart';

class SetsScreen extends StatelessWidget {
  const SetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            ElevatedButton(
              onPressed:(){Navigator.pop(context);},
              child:const Icon(Icons.arrow_back, size: 20),
              ),
            Expanded(child: PSetList(path: "https://api.pokemontcg.io/v2/sets?orderBy=set.releaseDate"))
          ],
      
      ),
    );
  }
}