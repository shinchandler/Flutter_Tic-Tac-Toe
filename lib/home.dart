import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String displayXO = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[800],
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: _tapped,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade700)),
                  child: Center(
                      child: Text(
                    displayXO,
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  )),
                ),
              );
            },
          )),
    );
  }

  void _tapped() {
    setState(() {
      displayXO = 'X';
    });
    
  }
}
