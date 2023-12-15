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
        footer: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(100, 0, 0, 0)), 
          child:Padding(padding: EdgeInsets.all(5), child: pcard.favourite?const Icon(Icons.favorite):const Icon(Icons.favorite_border),)),
        child: Image.network(pcard.imageUrlS),
    );
  }
}