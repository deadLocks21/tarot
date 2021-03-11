import 'package:flutter/material.dart';
import 'package:tarot/logic/Tarot.dart';
import 'package:tarot/logic/Tour.dart';

class PartenaireInput extends StatefulWidget {
  Tour tour;
  PartenaireInput({Key key, this.tour}) : super(key: key);

  @override
  _PartenaireInputState createState() => _PartenaireInputState();
}

class _PartenaireInputState extends State<PartenaireInput> {
  @override
  void initState() {
    super.initState();
    this.widget.tour.partenaire = Tarot.partieEnCours
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
            border: OutlineInputBorder(), labelText: "Partenaire"),
        onChanged: (String newValue) {
          setState(() {
            this.widget.tour.partenaire =
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
