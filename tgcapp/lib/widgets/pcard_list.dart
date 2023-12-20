
import 'package:flutter/material.dart';
import 'package:tgcapp/api.dart';
import 'package:tgcapp/models/favourite_save.dart';
import 'package:tgcapp/modules/p_card.dart';
import 'package:tgcapp/widgets/card_from_home.dart';
import 'dart:math';

// ignore: must_be_immutable
class PCardList extends StatelessWidget {
  PCardList({super.key, required this.path});

  String path;
  int i = Random().nextInt(6)+1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiLoadPCards(path), 
        builder: (
          BuildContext context,
          AsyncSnapshot<List<PCard>> snapshot,
        ) {
          if (snapshot.hasError) {
            return Image(image: AssetImage("assets/not_found_0$i.png"),);
          }
          if (!snapshot.hasData)
          {
            return const Center(child: CircularProgressIndicator());
          }
        final cardList = snapshot.data!;
        if(cardList.isEmpty)
        {
          return Image(image: AssetImage("assets/not_found_0$i.png"),);
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20),
          itemCount: cardList.length,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          
          itemBuilder: (BuildContext context, int index)
          {
            checkIn(cardList[index]);
            return CardFromHome(pcard: cardList[index]);
          },
        );
        },
    );
  }
}