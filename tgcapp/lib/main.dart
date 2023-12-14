import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tgcapp/screens/home_Screen.dart';
import 'package:tgcapp/screens/sets_Screen.dart';

void main(List<String> args) {
  runApp(TCGApp());
}

// ignore: must_be_immutable
class TCGApp extends StatelessWidget {
   TCGApp({super.key});

   String path = "https://api.pokemontcg.io/v2/cards?page=2&pageSize=4";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:
    {
      "/": (context) => HomeScreen(path: path, tcgapp: this,),
      "/sets": (context) => StesScreenS(path: path, tcgApp: this),
    }
    );
  }
  String getArandomPath()
{
  String path;
  int randpage = Random().nextInt(10)+1;
  path = "https://api.pokemontcg.io/v2/cards?page=${randpage}&pageSize=4";

  return path;
}

}

