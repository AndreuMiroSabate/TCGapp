

import 'package:flutter/material.dart';
import 'package:tgcapp/modules/p_set.dart';
import 'package:tgcapp/widgets/functions_class.dart';

class SetsToScreen extends StatelessWidget {
  const SetsToScreen({super.key, required this.pset});

  final PSet pset;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: OutlinedButton(
          onPressed: (){
            cPath.path = "https://api.pokemontcg.io/v2/cards?q=set.name:${pset.name}";
            Navigator.of(context).pushNamed("/results");   
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
          )
        ),
          child:Image.network(pset.image),
      )
    );
  }
}