

import 'package:flutter/material.dart';
import 'package:tgcapp/main.dart';
import 'package:tgcapp/widgets/pset_list.dart';

// ignore: must_be_immutable
class SetsScreen extends StatelessWidget {
  SetsScreen({super.key, required this.path, required this.tcgApp});

  String path;
  TCGApp tcgApp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            ElevatedButton(
              onPressed:(){
                Navigator.pop(context);
                //tcgApp.changepath(tcgApp.getArandomPath());
              },
              child:const Icon(Icons.arrow_back, size: 20),
              ),
            Expanded(child: PSetList(path: "https://api.pokemontcg.io/v2/sets?orderBy=set.releaseDate"))
          ],
      
      ),
    );
  }
}

// ignore: must_be_immutable
class StesScreenS extends StatefulWidget {
  StesScreenS({super.key,required this.path, required this.tcgApp});

  String path;
  TCGApp tcgApp;

  @override
  State<StesScreenS> createState() => _StesScreenSState();
}

class _StesScreenSState extends State<StesScreenS> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            ElevatedButton(
              onPressed:(){
                setState(() {
                  widget.path = widget.tcgApp.getArandomPath();
                  Navigator.pop(context);
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