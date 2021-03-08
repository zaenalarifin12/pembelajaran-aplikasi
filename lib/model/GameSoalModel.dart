import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pembelajaran/network/BaseUrl.dart';

class GameSoalModel {
  final int id;
  final String name;
  final String gambar;

  GameSoalModel({this.id, this.name, this.gambar});

  factory GameSoalModel.createGameSoal(Map<String, dynamic> json) {
    return GameSoalModel(
        id: json["id"], name: json["name"], gambar: json["gambar"]);
  }

  static Future<List<GameSoalModel>> getGameSoalFromApi() async {
    String apiUrl = BaseUrl.game;

    var apiResult = await http.get(apiUrl);

    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      return (jsonObject["data"] as List)
          .map((e) => GameSoalModel.createGameSoal(e))
          .toList();
    } else {
      throw Exception('Failed to load atap');
    }
  }
}
