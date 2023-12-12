
import 'dart:convert';

import 'package:tgcapp/modules/p_card.dart';
import 'package:http/http.dart' as http;

Future<List<PCard>> apiLoadPCards() async{
  final List<PCard> pcardList = [];
  final uri = Uri.parse("https://api.pokemontcg.io/v2/cards");
  final response = await http.get(uri, headers: {"X-Api-Key":"8088de87-0aad-4518-be85-6c043f81e54a"});
  final json = jsonDecode(response.body);
  final jsonPCardList = json["data"];
  for (final jsonPCard in jsonPCardList)
  {
    final pcard = PCard.fromJson(jsonPCard);
    pcardList.add(pcard);
  }
  return pcardList;

}