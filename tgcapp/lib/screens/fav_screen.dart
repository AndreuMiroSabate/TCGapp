import 'package:flutter/material.dart';
import 'package:tgcapp/widgets/functions_class.dart';
import 'package:tgcapp/widgets/pcard_fav_list.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 101, 141),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Image(
              image: AssetImage("assets/background_pokeball.png"),
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cPath = ClassPath(getArandomPath());
                        Navigator.of(context).pushNamed("/");
                      });
                    },
                    child: const Icon(Icons.arrow_back, size: 20),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage("assets/TCG_Logo_Favs.png"),
                      height: 300,
                    ),
                  ),
                  Expanded(child: PCardFavList())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
