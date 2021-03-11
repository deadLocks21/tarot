import 'package:flutter/material.dart';
import 'package:tarot/ihm/ScorePage/DisplayPlayers.dart';
import 'package:tarot/ihm/ScorePage/DisplayScores.dart';
import 'package:tarot/ihm/ScorePage/DisplayTotal.dart';
import 'package:tarot/ihm/ScorePage/FAB.dart';
import 'package:tarot/ihm/ScorePage/ScoreDivider.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(top: 16)),
            DisplayPlayers(),
            ScoreDivider(),
            DisplayScores(),
            ScoreDivider(),
            DisplayTotal(),
          ],
        ),
      ),
      floatingActionButton: FAB(),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text("Scores"),
    );
  }
}
