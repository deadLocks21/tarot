import 'package:flutter/material.dart';
import 'package:tarot/logic/Tarot.dart';
import 'package:tarot/logic/Tour.dart';

// ignore: must_be_immutable
class PrenneurInput extends StatefulWidget {
  Tour tour;
  PrenneurInput({Key key, this.tour}) : super(key: key);

  @override
  _PrenneurInputState createState() => _PrenneurInputState();
}

class _PrenneurInputState extends State<PrenneurInput> {
  @override
  void initState() {
    super.initState();
    this.widget.tour.prenneur = Tarot.partieEnCours
        .getPlayerByName(Tarot.partieEnCours.playersNames[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: DropdownButtonFormField<String>(
        icon: Icon(Icons.arrow_downward),
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: "Prenneur"),
        onChanged: (String newValue) {
          setState(() {
            this.widget.tour.prenneur =
                Tarot.partieEnCours.getPlayerByName(newValue);
          });
        },
        items: Tarot.partieEnCours.playersNames
            .map<DropdownMenuItem<String>>((dynamic value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: Tarot.partieEnCours.playersNames[0],
      ),
    );
  }
}
