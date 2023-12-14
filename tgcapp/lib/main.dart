import 'package:flutter/material.dart';
import 'package:tgcapp/screens/home_Screen.dart';
import 'package:tgcapp/screens/sets_Screen.dart';

void main(List<String> args) {
  runApp(const TCGApp());
}

// ignore: must_be_immutable
class TCGApp extends StatelessWidget {
  const TCGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:
      {
        "/": (context) => const HomeScreen(),
        "/sets": (context) => const StesScreenS(),
      }
    );
  }
}

