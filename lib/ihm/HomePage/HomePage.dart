import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarot/ihm/HomePage/Body.dart';
import 'package:tarot/logic/Tarot.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Tarot.getSave(),
        builder: (context, AsyncSnapshot snapshot) {
          Widget widget;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              widget = Center(child: CircularProgressIndicator());
              break;
            default:
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                widget = Text('Error');
              } else {
                widget = Body();
              }
          }
          return widget;
        },
      ),
    );
  }
}
