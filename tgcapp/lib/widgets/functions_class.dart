import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

ClassPath cPath = ClassPath("https://api.pokemontcg.io/v2/cards?page=3&pageSize=4");
List<FilterValues> allFilterValues = List.filled(0, FilterValues(List.filled(0, "fill")));

class ClassPath {
  String path;
  ClassPath(this.path);
}

String getArandomPath()
{
  String path;
  int randpage = Random().nextInt(10)+1;
  path = "https://api.pokemontcg.io/v2/cards?page=$randpage&pageSize=4";
  return path;
}

class FilterValues
{
  List<String> pType;
  FilterValues(this.pType);
}

void getAllFilters(List<FilterValues> toEqual) async
{
  List<FilterValues> values = List.filled(0, FilterValues(List.filled(0, "fill")));

  final dir = await getApplicationDocumentsDirectory();
  final file = File("${dir.absolute.path}\\external\\filterdata.json");
  final content = await file.readAsString();
  final sup = jsonDecode(content);
  for(final a in sup)
  {
    values.add(a.fromJson().toList());
  }
  toEqual = values;
}
