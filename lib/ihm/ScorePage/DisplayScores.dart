import 'package:flutter/material.dart';
import 'package:tarot/logic/Joueur.dart';
import 'package:tarot/logic/Tarot.dart';

class DisplayScores extends StatefulWidget {
  DisplayScores({Key key}) : super(key: key);

  @override
  _DisplayScoresState createState() => _DisplayScoresState();
}

class _DisplayScoresState extends State<DisplayScores> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Tarot.partieEnCours.players,
      builder: (BuildContext context, List<Joueur> values, Widget widget) {
        List<Widget> inTheR = [];

        for (Joueur joueur in values)
          inTheR.add(Container(
            width: MediaQuery.of(context).size.width *
                (0.9 / Tarot.partieEnCours.numberOfPlayers()),
            child: Center(
              child: Column(
                children: [
                  for (int i in joueur.scores) Text(i.toString()),
                ],
              ),
            ),
          ));

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: inTheR,
        );
      },
    );
  }
}
