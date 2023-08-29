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
      _checkWinner();
      
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != '') {
      _display(displayXO[0]);
    }
    if (displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3] != '') {
      _display(displayXO[3]);
    }
    if (displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6] != '') {
      _display(displayXO[6]);
    }
    if (displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0] != '') {
      _display(displayXO[0]);
    }
    if (displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1] != '') {
      _display(displayXO[1]);
    }
    if (displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2] != '') {
      _display(displayXO[2]);
    }
    if (displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0] != '') {
      _display(displayXO[0]);
    }
    if (displayXO[2] == displayXO[4] && displayXO[2] == displayXO[6] && displayXO[2] != '') {
      _display(displayXO[2]);
    }
  }

  void _display(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is :$winner'),
          );
        });
  }
}
