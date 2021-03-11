import 'package:flutter/material.dart';
import 'package:tarot/logic/Tour.dart';

class PetitAttaqueOuDefInput extends StatefulWidget {
  Tour tour;
  PetitAttaqueOuDefInput({Key key, this.tour}) : super(key: key);

  @override
  _PetitAttaqueOuDefInputState createState() => _PetitAttaqueOuDefInputState();
}

class _PetitAttaqueOuDefInputState extends State<PetitAttaqueOuDefInput> {
  Qui qui = Qui.attaque;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: this.widget.tour.petitVN,
      builder: (BuildContext context, bool value, Widget widget) {
        Widget nullWidget = Container();

        Widget goodWidget = Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Petit au bout: "),
              Radio<Qui>(
                value: Qui.attaque,
                groupValue: qui,
                onChanged: (Qui value) {
                  setState(() {
                    qui = Qui.attaque;
                    this.widget.tour.petitQui = "A";
                  });
                },
              ),
              Text("Attaque"),
              Radio<Qui>(
                value: Qui.defense,
                groupValue: qui,
                onChanged: (Qui value) {
                  setState(() {
                    qui = Qui.defense;
                    this.widget.tour.petitQui = "D";
                  });
                },
              ),
              Text("Défense"),
            ],
          ),
        );

        return value ? goodWidget : nullWidget;
      },
    );
  }
}

enum Qui { attaque, defense }
