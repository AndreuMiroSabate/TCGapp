class PCard {
  String name, supertype, id;
  dynamic type;
  String setName;
  String imageUrlL, imageUrlS;
  String number;
  bool favourite;

  PCard.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        id = json["id"],
        type = json["types"] != null && json["types"].isNotEmpty
            ? json["types"][0]
            : "none",
        supertype = json["supertype"],
        setName = json["set"]["name"],
        imageUrlL = json["images"]["large"],
        imageUrlS = json["images"]["small"],
        number = json["number"],
        favourite = false;
}
