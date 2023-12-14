
import 'dart:convert';

import 'package:tgcapp/modules/p_card.dart';
import 'package:http/http.dart' as http;
import 'package:tgcapp/modules/p_set.dart';

Future<List<PCard>> apiLoadPCards(String path) async{
  final uri = Uri.parse(path);
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

Future<List<PSet>> apiLoadPSets(String path) async{
  final uri = Uri.parse(path);
  final response = await http.get(
    uri, 
    headers: {"X-Api-Key":"8088de87-0aad-4518-be85-6c043f81e54a"},);
  final json = jsonDecode(response.body);
  final jsonPSetList = json["data"];
  final List<PSet> pSetList = [];
  for (final jsonPSet in jsonPSetList)
  {
    final pset = PSet.fromJson(jsonPSet);
    pSetList.add(pset);
  }
  return pSetList;

}