
import 'package:flutter/material.dart';
import 'package:tgcapp/api.dart';
import 'package:tgcapp/widgets/buttons_from_filter.dart';

// ignore: must_be_immutable
class FiltersList extends StatelessWidget {
  FiltersList({super.key, required this.path, required this.title});
  String path;
  String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiLoadFilters(path), 
        builder: (
          BuildContext context,
          AsyncSnapshot<List<String>> snapshot,
        ) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error.toString());
          }
          if (!snapshot.hasData)
          {
            return const Center(child: CircularProgressIndicator());
          }
        final filterList = snapshot.data!;
        return ButtonsFromFilter(filterValues: filterList, title: title);
        },
    );
  }
}