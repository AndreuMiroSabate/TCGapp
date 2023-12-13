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
    return ListTile(
      title: Text(pcard.name),
      leading:CircleAvatar(
        backgroundImage: NetworkImage(pcard.imageUrl),
      ),
    );
  }
}