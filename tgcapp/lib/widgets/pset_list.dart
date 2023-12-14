
import 'package:flutter/material.dart';
import 'package:tgcapp/api.dart';
import 'package:tgcapp/modules/p_set.dart';
import 'package:tgcapp/widgets/sets_to_screen.dart';

// ignore: must_be_immutable
class PSetList extends StatelessWidget {
  PSetList({super.key, required this.path});

  String path;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: apiLoadPSets(path), 
              builder: (
                BuildContext context,
                AsyncSnapshot<List<PSet>> snapshot,
              ) {
                if (snapshot.hasError) {
                  return ErrorWidget(snapshot.error.toString());
                }
                if (!snapshot.hasData)
                {
                  return const Center(child: CircularProgressIndicator());
                }
              final setsList = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20),
                itemCount: setsList.length,
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                
                itemBuilder: (BuildContext context, int index)
                {
                  return SetsToScreen(pset: setsList[index]);
                },
              );
             },
          );
  }
}