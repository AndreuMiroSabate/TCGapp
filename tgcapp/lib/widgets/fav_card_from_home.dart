import 'package:flutter/material.dart';
import 'package:tgcapp/models/favourite_save.dart';

class FavCardFromHome extends StatelessWidget {
  const FavCardFromHome({
    super.key,
    required this.pcard,
  });

  final SavedCardClass pcard;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color.fromARGB(100, 0, 0, 0)),
        child: const Padding(
          padding: EdgeInsets.all(5),
        ),
      ),
      child: Image.network(pcard.imgPath),
    );
  }
}
