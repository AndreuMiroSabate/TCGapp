import 'package:flutter/material.dart';
import 'package:tgcapp/models/favourite_save.dart';
import 'package:tgcapp/modules/p_card.dart';

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
      footer: Padding(
        padding: const EdgeInsets.all(5),
        child: Stack(
          alignment: Alignment.center,
          children: [ElevatedButton(
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 88, 145, 202))),
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
                ? const Icon(Icons.star, color: Colors.amber,)
                : const Icon(Icons.star_border, color: Color.fromARGB(255, 107, 90, 36)),
          ),
        ]),
      ),
      child: Image.network(widget.pcard.imageUrlS),
    );
  }
}
