import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

/// Klasa odpowiedzielna za zarządzanie danymi przechowywanymi w pliku JSON

class JsonHandler with ChangeNotifier {
  List<dynamic> jsonData = [];

  Future<void> loadJson() async {
    var jsonRaw = await rootBundle.loadString('assets/attractions.json');
    jsonRaw = jsonRaw.replaceAll("\\\\n","\\n");
    jsonData = jsonDecode(jsonRaw) as List<dynamic>;
    notifyListeners();
  }

  Future<List<dynamic>> returnJson() {
    return loadJson().then((_) => jsonData);
  }

  String returnDescription(int id){
    for (var object in jsonData) {
      if (object['id'] == id) {
        return object['description'];
      }
    }
    return 'Object not found';
  }

  String returnName(int id){
    for (var object in jsonData) {
      if (object['id'] == id) {
        return object['name'];
      }
    }
    return 'Object not found';
  }

  String returnTag(int id){
    for (var object in jsonData) {
      if (object['id'] == id) {
        return object['tag'];
      }
    }
    return 'Object not found';
  }
}