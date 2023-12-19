import 'package:flutter/material.dart';
import 'package:tgcapp/widgets/functions_class.dart';
import 'package:tgcapp/widgets/pcard_list.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
          image: AssetImage("assets/Projecte nou.png"),
          fit: BoxFit.cover,
        ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: const Icon(Icons.arrow_back, size: 20),
                
              ),
              Expanded(child: PCardList(path: cPath.path))
            ],
                    ),
          ),
      ]),
    );
  }
}
