import 'package:flutter/material.dart';
import 'package:tgcapp/models/favourite_save.dart';
import 'package:tgcapp/modules/p_card.dart';

/*class CardFromHome extends StatelessWidget {
  const CardFromHome({
    super.key,
    required this.pcard,
  });

  final PCard pcard;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color.fromARGB(100, 0, 0, 0)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              pcard.favourite = !pcard.favourite;
              if (!pcard.favourite) {
                checkOut(pcard.id);
              }
              saveList(savedCards);
            },
            child: pcard.favourite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          ),
        ),
      ),
      child: Image.network(pcard.imageUrlS),
    );
  }
}*/

class CardFromHome extends StatefulWidget {
  const CardFromHome({
    super.key,
    required this.pcard,
  });

  final PCard pcard;

  @override
  State<CardFromHome> createState() => _CardFromHomeState();
}

class _CardFromHomeState extends State<CardFromHome> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color.fromARGB(100, 0, 0, 0)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                widget.pcard.favourite = !widget.pcard.favourite;
                if (!widget.pcard.favourite) {
                  checkOut(widget.pcard.id);
                } else {
                  savedCards.add(
                    SavedCardClass(
                      widget.pcard.id,
                      widget.pcard.imageUrlS,
                    ),
                  );
                }
              });
              saveList(savedCards);
            },
            child: widget.pcard.favourite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          ),
        ),
      ),
      child: Image.network(widget.pcard.imageUrlS),
    );
  }
}
