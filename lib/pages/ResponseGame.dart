import 'package:flutter/material.dart';
import 'package:pembelajaran/pages/GamePage.dart';

class ResponseGame extends StatefulWidget {
  final int benar;
  ResponseGame(this.benar);

  @override
  _ResponseGameState createState() => _ResponseGameState();
}

class _ResponseGameState extends State<ResponseGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    (widget.benar == 1) ? Color(0xFF00af91) : Color(0xFFaf0069),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    (widget.benar == 1)
                        ? "Jawaban Anda Benar\n 🤟🤟🤟🤟🤟🤟🤟"
                        : "Jawaban Anda Salah\n 🤣🤣🤣🤣🤣🤣🤣",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                 Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamePage()));
              },
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF6930c3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Kembali Ke Game",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
