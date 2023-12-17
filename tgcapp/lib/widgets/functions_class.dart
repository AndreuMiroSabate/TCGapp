
import 'dart:math';


ClassPath cPath =
    ClassPath("https://api.pokemontcg.io/v2/cards?page=3&pageSize=4");
List<FilterValues> allFilterValues = [];

class ClassPath {
  String path;
  ClassPath(this.path);
}

String getArandomPath() {
  String path;
  int randpage = Random().nextInt(10) + 1;
  path = "https://api.pokemontcg.io/v2/cards?page=$randpage&pageSize=4";
  return path;
}

class FilterValues {
  List<String> pType;

  FilterValues(this.pType);

  // Add a factory method to convert JSON to FilterValues
  factory FilterValues.fromJson(Map<String, dynamic> json) {
    return FilterValues(List<String>.from(json['pType']));
  }
}

