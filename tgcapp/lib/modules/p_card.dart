class PCard {
  String name, supertype, subtype;
  dynamic type;
  String setName;
  String imageUrl;
  String number;

  PCard.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["types"],
        supertype = json["supertype"],
        subtype = json["subtypes"],
        setName = json["set"]["name"],
        imageUrl = json["images"]["large"],
        number = json["number"];
}
