import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pembelajaran/model/GameSoalModel.dart';
import 'package:http/http.dart' as http;
import 'package:pembelajaran/network/BaseUrl.dart';
import 'package:pembelajaran/pages/DetailGame.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<GameSoalModel> listGame = [];

  getListGame() async {
    final response = await http.get(BaseUrl.game);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final dataMateri = jsonDecode(response.body)["data"];

      for (Map i in dataMateri) {
        listGame.add(GameSoalModel.createGameSoal(i));
      }

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getListGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFef8d32),
        title: Text("Daftar Game"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        shrinkWrap: false,
        itemCount: listGame.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailGame(listGame[index].id),
                ),
              );
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xFFef8d44),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "${listGame[index].name}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
