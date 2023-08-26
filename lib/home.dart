import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _onTapped(index);
            },
            child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  displayXO[index],
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ))),
          );
        },
      ),
    );
  }

  void _onTapped(index) {
    setState(() {
      if (oTurn) {
        displayXO[index] = 'O';
      } else {
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
    });
  }
}
