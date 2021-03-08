import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pembelajaran/network/BaseUrl.dart';

class MateriModel {
  final int id;
  final String title;

  MateriModel({this.id, this.title});

  factory MateriModel.createMateri(Map<String, dynamic> json) {
    return MateriModel(
        id: json["id"],
        title: json["title"]);
  }

  static Future<List<MateriModel>> getMateriFromApi() async {
    String apiUrl = BaseUrl.materi;

    var apiResult = await http.get(apiUrl);

    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      return (jsonObject["data"] as List)
          .map((e) => MateriModel.createMateri(e))
          .toList();
    } else {
      throw Exception('Failed to load atap');
    }
  }
}
