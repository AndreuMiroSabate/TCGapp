import 'package:flutter/material.dart';
import 'package:tgcapp/api.dart';
import 'package:tgcapp/models/favourite_save.dart';
import 'package:tgcapp/modules/p_card.dart';
import 'dart:math';

import 'package:tgcapp/widgets/fav_card_from_home.dart';

// ignore: must_be_immutable
class PCardFavList extends StatelessWidget {
  PCardFavList({super.key});

  int i = Random().nextInt(6) + 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          apiLoadPCards("https://api.pokemontcg.io/v2/cards?page=1&pageSize=1"),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<PCard>> snapshot,
      ) {
        if (savedCards.isEmpty) {
          return Image(
            image: AssetImage("assets/not_found_0$i.png"),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20),
          itemCount: savedCards.length,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          itemBuilder: (BuildContext context, int index) {
            return FavCardFromHome(pCard: savedCards[index]);
          },
        );
      },
    );
  }
}
