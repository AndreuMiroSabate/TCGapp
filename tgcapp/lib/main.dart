import 'package:flutter/material.dart';
import 'package:tgcapp/screens/fav_screen.dart';
import 'package:tgcapp/screens/filters_screen.dart';
import 'package:tgcapp/screens/home_screen.dart';
import 'package:tgcapp/screens/results_screen.dart';
import 'package:tgcapp/screens/sets_screen.dart';

void main(List<String> args) {
  runApp(const TCGApp());
}

// ignore: must_be_immutable
class TCGApp extends StatelessWidget {
  const TCGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      "/": (context) => const HomeScreen(),
      "/sets": (context) => const StesScreenS(),
      "/results": (context) => const ResultsScreen(),
      "/filters": (context) => FiltersScreen(),
      "/fav": (context) => const FavouriteScreen(),
    });
  }
}
