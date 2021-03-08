import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pembelajaran/model/Materi.dart';
import 'package:http/http.dart' as http;
import 'package:pembelajaran/network/BaseUrl.dart';
import 'package:pembelajaran/pages/DetailMateri.dart';

class MateriPage extends StatefulWidget {
  @override
  _MateriPageState createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  List<MateriModel> listMateri = [];

  getListMateri() async {
    final response = await http.get(BaseUrl.materi);

    if (response.statusCode == 200) {
      final dataMateri = jsonDecode(response.body)["data"];

      for (Map i in dataMateri) {
        listMateri.add(MateriModel.createMateri(i));
      }

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getListMateri();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00917c),
        title: Text("Daftar Materi"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        shrinkWrap: false,
        itemCount: listMateri.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailMateri(listMateri[index].id)));
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF00917c),
                ),
                child: Center(
                  child: Text(
                    "${listMateri[index].title}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
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
