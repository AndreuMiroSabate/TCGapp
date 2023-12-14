class PCard {
  String name, supertype;
  String type;
  String setName;
  String imageUrlL, imageUrlS;
  String number;

  PCard.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["types"][0],
        supertype = json["supertype"],
        setName = json["set"]["name"],
        imageUrlL = json["images"]["large"],
        imageUrlS = json["images"]["small"],
        number = json["number"];
}
