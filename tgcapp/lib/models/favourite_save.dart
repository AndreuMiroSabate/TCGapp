import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:tgcapp/modules/p_card.dart';

List<SavedCardClass> savedCards = List.empty(growable: true);

class SavedCardClass {
  String cardID;
  String imgPath;
  bool isFav;

  SavedCardClass(this.cardID, this.imgPath, [this.isFav = true]);

  SavedCardClass.fromJson(Map<String, dynamic> json)
      : cardID = json['id'],
        imgPath = json['path'],
        isFav = json['isFav'] ?? false;

  Map<String, dynamic> toJson() => {
        "id": cardID,
        "path": imgPath,
        "isFav": isFav,
      };
}

Future<void> saveList(List<SavedCardClass> favList) async {
  final dir = await getApplicationDocumentsDirectory();
  final jsonList = jsonEncode(favList);
  final filePath = path.join(dir.absolute.path, "fav-card-list.json");
  final file = File(filePath);
  await file.writeAsString(jsonList);
}

Future<List<SavedCardClass>> loadTodoList() async {
  final dir = await getApplicationDocumentsDirectory();
  final filePath = path.join(dir.absolute.path, "fav-card-list.json");
  final file = File(filePath);
  if (!(await file.exists())) {
    return [];
  }
  final content = await file.readAsString();
  final List jsonList = jsonDecode(content);
  return jsonList.map((todoJson) => SavedCardClass.fromJson(todoJson)).toList();
}

void checkOut(String iD) {
  for (int i = 0; i < savedCards.length; i++) {
    if (savedCards[i].cardID == iD) {
      savedCards.removeAt(i);
      break;
    }
  }
}

void checkIn(PCard lista) {
    for (int i = 0; i < savedCards.length; i++) {
      if (savedCards[i].cardID == lista.id) {
        lista.favourite = true;
      }
    }
}
