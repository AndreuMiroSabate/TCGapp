class PSet{
  String name, image;

  PSet.fromJson(Map<String, dynamic> json)
  :name = json["name"],
  image = json["images"]["logo"];

}