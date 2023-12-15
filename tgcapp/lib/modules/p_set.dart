class PSet{
  String name, image, id;

  PSet.fromJson(Map<String, dynamic> json)
  :name = json["name"],
  image = json["images"]["logo"],
  id = json["id"];

}