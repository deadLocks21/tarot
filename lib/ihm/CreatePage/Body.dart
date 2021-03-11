import 'package:flutter/material.dart';
import 'package:tarot/ihm/CreatePage/AddAPlayer.dart';
import 'package:tarot/ihm/CreatePage/ListOfPlayers.dart';
import 'package:tarot/logic/Tarot.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                AddAPlayer(),
                ListOfPlayers(),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: Tarot.partieEnCreation.launch,
            builder: (BuildContext context, bool value, Widget widget) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  child: Text('Lancer la partie'),
                  onPressed: value
                      ? (Tarot.partieEnCours == null
                          ? startGame
                          : _showMyDialog)
                      : null,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void startGame() async {
    Tarot.partieEnCoursVN.value = Tarot.partieEnCreation;
    Tarot.partieEnCreation = null;
    Tarot.save();
    Navigator.pop(context, true);
  }

  _showMyDialog() async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Créer une nouvelle partie ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    '        Attention, en créant une nouvelle partie, vous allez effacer la partie sauvegardée.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Créer'),
              onPressed: () {
                Navigator.pop(context);
                startGame();
              },
            ),
          ],
        );
      },
    );
  }
}
