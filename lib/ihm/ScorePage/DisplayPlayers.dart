import 'package:flutter/material.dart';
import 'package:tarot/logic/Tarot.dart';

class DisplayPlayers extends StatefulWidget {
  DisplayPlayers({Key key}) : super(key: key);

  @override
  _DisplayPlayersState createState() => _DisplayPlayersState();
}

class _DisplayPlayersState extends State<DisplayPlayers> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (String jName in Tarot.partieEnCours.playersNames)
          Container(
            width: MediaQuery.of(context).size.width *
                (0.9 / Tarot.partieEnCours.numberOfPlayers()),
            child: Center(
              child: Text(
                jName,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
      ],
    );
  }
}
