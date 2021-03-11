import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tarot/logic/Partie.dart';

class Tarot {
  static Partie partieEnCreation;
  static ValueNotifier<Partie> partieEnCoursVN = ValueNotifier(null);
  static Partie get partieEnCours => partieEnCoursVN.value;

  static getSave() async {
    var directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/save.json');

    if (!file.existsSync()) {
      file.createSync(recursive: true);
      file.writeAsStringSync("{}");
    }

    var fileContent = file.readAsStringSync();
    if (fileContent != "{}") {
      Map<String, dynamic> json = jsonDecode(fileContent);
      partieEnCoursVN.value = new Partie.fromJson(json);
    }
  }

  static save() async {
    var directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/save.json');

    file.writeAsString(jsonEncode(partieEnCours.toJson()));
  }
}
