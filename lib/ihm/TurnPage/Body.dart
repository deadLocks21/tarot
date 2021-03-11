import 'package:flutter/material.dart';
import 'package:tarot/ihm/TurnPage/ContratInput.dart';
import 'package:tarot/ihm/TurnPage/NumberOfOudlersInput.dart';
import 'package:tarot/ihm/TurnPage/PartenaireInput.dart';
import 'package:tarot/ihm/TurnPage/PetitAttaqueOuDefInput.dart';
import 'package:tarot/ihm/TurnPage/PetitPoigneeInput.dart';
import 'package:tarot/ihm/TurnPage/PrenneurInput.dart';
import 'package:tarot/ihm/TurnPage/ScoreInput.dart';
import 'package:tarot/logic/Contrats.dart';
import 'package:tarot/logic/Tarot.dart';
import 'package:tarot/logic/Tour.dart';

class Body extends StatefulWidget {
  Tour tour;
  Body({Key key, this.tour}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Tour tourEnCours;

  @override
  void initState() {
    super.initState();
    tourEnCours = this.widget.tour;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PrenneurInput(tour: this.tourEnCours),
                if (Tarot.partieEnCours.numberOfPlayers() == 5)
                  PartenaireInput(tour: this.tourEnCours),
                ContratInput(tour: this.tourEnCours),
                NumberOfOudlersInput(tour: this.tourEnCours),
                PetitPoigneeInput(tour: this.tourEnCours),
                PetitAttaqueOuDefInput(tour: this.tourEnCours),
                ScoreInput(tour: this.tourEnCours),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
