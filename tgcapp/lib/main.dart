import 'package:flutter/material.dart';
import 'package:tgcapp/screens/home_Screen.dart';

void main(List<String> args) {
  runApp(const TCGApp());
}

class TCGApp extends StatelessWidget {
  const TCGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomeScreen()
        ),
    );
  }
}
