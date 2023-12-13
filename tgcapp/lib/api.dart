
import 'dart:convert';

import 'package:tgcapp/modules/p_card.dart';
import 'package:http/http.dart' as http;

Future<List<PCard>> apiLoadPCards() async{
  final uri = Uri.parse("https://api.pokemontcg.io/v2/cards?page=1&pageSize=1");
  final response = await http.get(
    uri, 
    headers: {"X-Api-Key":"8088de87-0aad-4518-be85-6c043f81e54a"},);
  final json = jsonDecode(response.body);
  final jsonPCardList = json["data"];
  final List<PCard> pcardList = [];
  for (final jsonPCard in jsonPCardList)
  {
    final pcard = PCard.fromJson(jsonPCard);
    pcardList.add(pcard);
  }
  return pcardList;

}