import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TCGApp());
}

class TCGApp extends StatelessWidget {
  const TCGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
