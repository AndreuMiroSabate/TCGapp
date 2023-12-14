import 'dart:math';

ClassPath cPath = ClassPath("https://api.pokemontcg.io/v2/cards?page=3&pageSize=4");

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