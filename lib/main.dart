import 'package:flutter/material.dart';
import 'package:tarot/ihm/HomePage/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// TODO Sérialiser la partie en cours
// TODO Compléter les poignées et le chelem
