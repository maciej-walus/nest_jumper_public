import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

/// Klasa odpowiedzielna za zarządzanie danymi przechowywanymi w pliku JSON

class JsonHandler {
  List<dynamic> jsonData = [];

  Future<void> loadAttractionsJson() async {
    var jsonRaw = await rootBundle.loadString('assets/attractions.json');
    jsonRaw = jsonRaw.replaceAll("\\\\n","\\n");
    jsonData = jsonDecode(jsonRaw) as List<dynamic>;
  }

  Future<List<dynamic>> returnAttractionsJson() {
    return loadAttractionsJson().then((_) => jsonData);
  }

  Future<void> loadFaqJson() async {
    var jsonRaw = await rootBundle.loadString('assets/faq.json');
    jsonRaw = jsonRaw.replaceAll("\\\\n","\\n");
    jsonData = jsonDecode(jsonRaw) as List<dynamic>;
  }

  Future<List<dynamic>> returnFaqJson() {
    return loadFaqJson().then((_) => jsonData);
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

  String returnQuestion(int id){
    for (var object in jsonData) {
      if (object['id'] == id) {
        return object['question'];
      }
    }
    return 'Object not found';
  }

  String returnAnswer(int id){
    for (var object in jsonData) {
      if (object['id'] == id) {
        return object['answer'];
      }
    }
    return 'Object not found';
  }
}