import 'package:flutter/material.dart';
import 'package:tarot/ihm/TurnPage/Body.dart';
import 'package:tarot/logic/Tarot.dart';
import 'package:tarot/logic/Tour.dart';

class TurnPage extends StatelessWidget {
  TurnPage({Key key}) : super(key: key);
  Tour tourEnCours = new Tour.voidTour();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Body(tour: tourEnCours),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text("Ajout d'un tour"),
      actions: [
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            Tarot.partieEnCours.addTour(tourEnCours);
            Tarot.save();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
