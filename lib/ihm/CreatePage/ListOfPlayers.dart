import 'package:flutter/material.dart';
import 'package:tarot/logic/Joueur.dart';
import 'package:tarot/logic/Tarot.dart';

class ListOfPlayers extends StatefulWidget {
  ListOfPlayers({Key key}) : super(key: key);

  @override
  _ListOfPlayersState createState() => _ListOfPlayersState();
}

class _ListOfPlayersState extends State<ListOfPlayers> {
  int selected = -1;
  List<String> entries = Tarot.partieEnCreation.playersNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Liste des joueurs'),
          ),
          Divider(
            thickness: 2.5,
          ),
          ValueListenableBuilder(
            valueListenable: Tarot.partieEnCreation.players,
            builder: (BuildContext context, List<Joueur> value, Widget widget) {
              entries = Tarot.partieEnCreation.playersNames;
              return ListView.separated(
                shrinkWrap: true,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      child: Text(
                        '${entries[index]}',
                        style: TextStyle(
                          fontSize: index == selected ? 16 : 14,
                          fontWeight: index == selected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: Text("SUPPRIMER"),
                  onPressed: () {
                    if (this.selected != -1) {
                      String playerName = this.entries[this.selected];
                      setState(() {
                        this.selected = -1;
                        Tarot.partieEnCreation.removePlayer(playerName);
                      });
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
