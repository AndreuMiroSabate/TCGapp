import 'package:flutter/material.dart';
import 'package:tgcapp/widgets/buttons_from_filter.dart';
import 'package:tgcapp/widgets/functions_class.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: const Icon(Icons.arrow_back, size: 20),
        ),
        Expanded(
          child: ListView.builder(padding: EdgeInsets.only(left: 20,right: 20),itemCount: allFilterValues.length, itemBuilder: (context, index){
              return ButtonsFromFilter();
          }),
          
        )
      ]),
    );
  }
}
