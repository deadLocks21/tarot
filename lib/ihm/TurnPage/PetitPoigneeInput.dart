import 'package:flutter/material.dart';
import 'package:tarot/logic/Tarot.dart';
import 'package:tarot/logic/Tour.dart';

class PetitPoigneeInput extends StatefulWidget {
  Tour tour;
  PetitPoigneeInput({Key key, this.tour}) : super(key: key);

  @override
  _PetitPoigneeInputState createState() => _PetitPoigneeInputState();
}

class _PetitPoigneeInputState extends State<PetitPoigneeInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: this.widget.tour.petit,
            onChanged: (value) {
              setState(() {
                this.widget.tour.petit = value;
              });
            },
          ),
          Text("Petit au bout"),
          Container(
            width: 16,
          ),
          Checkbox(
            value: this.widget.tour.poignee,
            onChanged: (value) {
              setState(() {
                this.widget.tour.poignee = value;
              });
            },
          ),
          Text("Poignée"),
        ],
      ),
    );
  }
}
