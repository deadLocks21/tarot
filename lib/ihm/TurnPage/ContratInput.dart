import 'package:flutter/material.dart';
import 'package:tarot/logic/Contrats.dart';
import 'package:tarot/logic/Tour.dart';

class ContratInput extends StatefulWidget {
  Tour tour;
  ContratInput({Key key, this.tour}) : super(key: key);

  @override
  _ContratInputState createState() => _ContratInputState();
}

class _ContratInputState extends State<ContratInput> {
  @override
  void initState() {
    super.initState();
    this.widget.tour.contrat =
        Contrats.getContratByName(Contrats.contratsNames[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width * 0.4,
      child: DropdownButtonFormField<String>(
        icon: Icon(Icons.arrow_downward),
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: "Contrat"),
        onChanged: (String newValue) {
          setState(() {
            this.widget.tour.contrat = Contrats.getContratByName(newValue);
          });
        },
        items: Contrats.contratsNames
            .map<DropdownMenuItem<String>>((dynamic value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: Contrats.contratsNames[0],
      ),
    );
  }
}
