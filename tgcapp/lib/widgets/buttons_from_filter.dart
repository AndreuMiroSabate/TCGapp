
import 'package:flutter/material.dart';

class ButtonsFromFilter extends StatefulWidget {
  const ButtonsFromFilter({super.key});

  @override
  State<ButtonsFromFilter> createState() => _ButtonsFromFilterState();
}

class _ButtonsFromFilterState extends State<ButtonsFromFilter> {
   String selectedValue = "Option 1";

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text("preview"),
        title: Container(
          padding: EdgeInsets.only(top: 20,bottom: 20),
          child: DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedValue = newValue;
            });
          }
                },
                items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
                }).toList(),
              ),
        ),
    );
  }
}