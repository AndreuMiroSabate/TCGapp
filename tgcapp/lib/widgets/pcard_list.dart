
import 'package:flutter/material.dart';
import 'package:tgcapp/api.dart';
import 'package:tgcapp/modules/p_card.dart';
import 'package:tgcapp/widgets/card_from_home.dart';

class PCardList extends StatelessWidget {
  const PCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: apiLoadPCards(), 
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
              return ListView.builder(
                itemCount: cardList.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return CardFromHome(pcard: cardList[index]);
                },
              );
             },
          );
  }
}