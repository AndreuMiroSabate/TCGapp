import 'package:flutter/material.dart';
import 'package:tgcapp/models/favourite_save.dart';

class FavCardFromHome extends StatefulWidget {
  const FavCardFromHome({
    super.key,
    required this.pCard,
  });

  final SavedCardClass pCard;

  @override
  State<FavCardFromHome> createState() => _FavCardFromHomeState();
}

class _FavCardFromHomeState extends State<FavCardFromHome> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Padding(
        padding: const EdgeInsets.all(5),
        child: Stack(alignment: Alignment.center, children: [
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 88, 145, 202))),
            onPressed: () {
              setState(() {
                widget.pCard.isFav = !widget.pCard.isFav;
                if (!widget.pCard.isFav) {
                  checkOut(widget.pCard.cardID);
                }
                Navigator.of(context).pushNamed("/fav");
              });
              saveList(savedCards);
            },
            child: widget.pCard.isFav
                ? const Icon(
                    Icons.star,
                    color: Colors.amber,
                  )
                : const Icon(Icons.star_border,
                    color: Color.fromARGB(255, 107, 90, 36)),
          ),
        ]),
      ),
      child: Image.network(widget.pCard.imgPath),
    );
  }
}
