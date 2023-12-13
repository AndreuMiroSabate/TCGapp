class PCard {
  String name, supertype;
  String type;
  String setName;
  String imageUrl;
  String number;

  PCard.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["types"][0],
        supertype = json["supertype"],
        setName = json["set"]["name"],
        imageUrl = json["images"]["large"],
        number = json["number"];
}
