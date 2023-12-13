
import 'package:flutter/material.dart';
import 'package:tgcapp/api.dart';
import 'package:tgcapp/modules/p_card.dart';
import 'package:tgcapp/widgets/card_from_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage("assets/TCG_Logo.png")),
            ),
            Align(
              alignment: const Alignment(0, -0.60),
              child: Container(
                height: 30,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                Icon(Icons.search, color: Colors.grey[700],),
                const Expanded(child: TextField())
               ]),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: null, child: Text("Filter")),
                  ElevatedButton(onPressed: null, child: Text("Sets")),
                  ElevatedButton(onPressed: null, child: Text("Favs")),
                ],
                
                      ),
            ),
            Align(
              alignment: const Alignment(-1, 0.45),
              child: FutureBuilder(
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
                ),
            ),
      ]
    );
  }
}