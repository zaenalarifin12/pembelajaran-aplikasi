import 'package:flutter/material.dart';
import 'package:pembelajaran/pages/DetailGame.dart';
import 'package:pembelajaran/pages/DetailMateri.dart';
import 'package:pembelajaran/pages/GamePage.dart';
import 'package:pembelajaran/pages/HomePage.dart';
import 'package:pembelajaran/pages/MateriPage.dart';
import 'package:pembelajaran/pages/TugasPage.dart';
import 'package:pembelajaran/pages/loginPage.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new HomePage(),
      '/materi': (BuildContext context) => new MateriPage(),
      '/game': (BuildContext context) => new GamePage(),
      '/tugas': (BuildContext context) => new TugasPage(),
      
    },
    debugShowCheckedModeBanner: false,
  ));
}


// main color 

// green    00917c
// blue     11698e
// orange   f58634
// red      ff005c
// purple   6930c3