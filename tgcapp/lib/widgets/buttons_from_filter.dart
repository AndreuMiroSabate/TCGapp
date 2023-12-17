import 'package:flutter/material.dart';
import 'package:tgcapp/widgets/functions_class.dart';

// ignore: must_be_immutable
class ButtonsFromFilter extends StatefulWidget {
  ButtonsFromFilter({super.key, required this.filterValues});
  FilterValues filterValues;
  @override
  State<ButtonsFromFilter> createState() => _ButtonsFromFilterState();
}

class _ButtonsFromFilterState extends State<ButtonsFromFilter> {

  @override
  Widget build(BuildContext context) {
  String selectedValue = widget.filterValues.pType[0];
    return ListTile(
      leading: const Text("preview"),
      title: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedValue = newValue;
              });
            }
          },
          items: widget.filterValues.pType
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
