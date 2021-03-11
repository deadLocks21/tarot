import 'package:flutter/material.dart';
import 'package:tarot/logic/Joueur.dart';
import 'package:tarot/logic/Tarot.dart';

class DisplayTotal extends StatefulWidget {
  DisplayTotal({Key key}) : super(key: key);

  @override
  _DisplayTotalState createState() => _DisplayTotalState();
}

class _DisplayTotalState extends State<DisplayTotal> {
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
              child: Text(joueur.total.toString()),
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
