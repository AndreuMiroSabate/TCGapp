
import 'package:flutter/material.dart';
import 'package:tgcapp/api.dart';
import 'package:tgcapp/modules/p_card.dart';
import 'package:tgcapp/widgets/card_from_home.dart';

// ignore: must_be_immutable
class PCardList extends StatelessWidget {
  PCardList({super.key, required this.path});

  String path;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: apiLoadPCards(path), 
              builder: (
                BuildContext context,
                AsyncSnapshot<List<PCard>> snapshot,
              ) {
                if (snapshot.hasError) {
                  return ErrorWidget(snapshot.error.toString());
                }
                if (!snapshot.hasData)
                {
                  return const Center(child: CircularProgressIndicator());
                }
              final cardList = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20),
                itemCount: cardList.length,
                padding: EdgeInsets.only(top: 20, bottom: 20),
                
                itemBuilder: (BuildContext context, int index)
                {
                  return CardFromHome(pcard: cardList[index]);
                },
              );
             },
          );
  }
}