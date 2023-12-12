import 'package:flutter/material.dart';
import 'package:tgcapp/modules/p_card.dart';

class CardFromHome extends StatelessWidget {
  const CardFromHome({
      super.key,
      required this.pcard,
    });

    final PCard pcard;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(pcard.imageUrl),
      
    );
  }
}