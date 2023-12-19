import 'package:flutter/material.dart';
import 'package:tgcapp/modules/filters_value.dart';

// ignore: must_be_immutable
class ButtonsFromFilter extends StatefulWidget {
  ButtonsFromFilter({super.key, required this.filterValues, required this.title});
  List<String> filterValues;
  String title;
  @override
  State<ButtonsFromFilter> createState() => _ButtonsFromFilterState();
}

class _ButtonsFromFilterState extends State<ButtonsFromFilter> {
  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.title,style: TextStyle(color: Colors.white)),
      title: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: DropdownButton<String>(
          dropdownColor: Color.fromARGB(255, 35, 46,72),
          value: selectedValue,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedValue = newValue;
                switch (widget.title)
                {
                  case "Type":
                  type = selectedValue;
                  case "Subtype":
                  subtype = selectedValue;
                  case "Supertype":
                  supertype = selectedValue;
                  case "Rarity":
                  rarity = selectedValue;
                }
              });
            }
          },
          items: widget.filterValues
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: TextStyle(color: Colors.white)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
