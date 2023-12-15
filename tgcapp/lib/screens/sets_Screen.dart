

import 'package:flutter/material.dart';
import 'package:tgcapp/widgets/functions_class.dart';
import 'package:tgcapp/widgets/pset_list.dart';

// ignore: must_be_immutable
class StesScreenS extends StatefulWidget {
 const StesScreenS({super.key});

  @override
  State<StesScreenS> createState() => _StesScreenSState();
}

class _StesScreenSState extends State<StesScreenS> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed:(){
                setState(() {
                  cPath = ClassPath(getArandomPath());
                  Navigator.of(context).pushNamed("/");
                });  
                },
              child:const Icon(Icons.arrow_back, size: 20),
              ),
            Expanded(child: PSetList(path: "https://api.pokemontcg.io/v2/sets?orderBy=set.releaseDate"))
          ],
      ),
    );
  }
}