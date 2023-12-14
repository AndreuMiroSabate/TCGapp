import 'package:flutter/material.dart';
import 'package:tgcapp/screens/home_Screen.dart';
import 'package:tgcapp/screens/sets_Screen.dart';

void main(List<String> args) {
  runApp(TCGApp());
}

// ignore: must_be_immutable
class TCGApp extends StatelessWidget {
   TCGApp({super.key});

   String path = "https://api.pokemontcg.io/v2/cards";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:
    {
      "/": (context) => const HomeScreen(),
      "/sets": (context) => const SetsScreen(),
    }
    );
  }
}
