import 'package:flutter/material.dart';
import 'package:tarot/logic/Joueur.dart';
import 'package:tarot/logic/Tarot.dart';

class AddAPlayer extends StatefulWidget {
  AddAPlayer({Key key}) : super(key: key);

  @override
  _AddAPlayerState createState() => _AddAPlayerState();
}

class _AddAPlayerState extends State<AddAPlayer> {
  TextEditingController _controller;
  String _error = "";

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nom du joueur',
              errorText: _error != "" ? _error : null,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: addPlayer,
          child: Text("Ajouter"),
        )
      ],
    );
  }

  void addPlayer() {
    if (Tarot.partieEnCreation.playersNames.contains(_controller.text)) {
      setState(() {
        _error = "Mais ... cette personne existe déjà non ?";
      });
    } else if (_controller.text == "") {
      setState(() {
        _error = "Euhhh qui est tu ?";
      });
    } else {
      setState(() {
        Tarot.partieEnCreation.addPlayer(Joueur(_controller.text));
      });
      _error = "";
      _controller.text = "";
    }
  }
}
