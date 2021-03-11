import 'package:flutter/material.dart';
import 'package:tarot/logic/Tour.dart';

class NumberOfOudlersInput extends StatefulWidget {
  Tour tour;
  NumberOfOudlersInput({Key key, this.tour}) : super(key: key);

  @override
  _NumberOfOudlersInputState createState() => _NumberOfOudlersInputState();
}

class _NumberOfOudlersInputState extends State<NumberOfOudlersInput> {
  NumberOfOudlers n2O = NumberOfOudlers.zero;

  @override
  void initState() {
    super.initState();
    this.widget.tour.nbOudlers = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Nombre de bouts: "),
          Radio<NumberOfOudlers>(
            value: NumberOfOudlers.zero,
            groupValue: n2O,
            onChanged: (NumberOfOudlers value) {
              setState(() {
                n2O = value;
                this.widget.tour.nbOudlers = n2O.index;
              });
            },
          ),
          Text("0"),
          Radio<NumberOfOudlers>(
            value: NumberOfOudlers.one,
            groupValue: n2O,
            onChanged: (NumberOfOudlers value) {
              setState(() {
                n2O = value;
                this.widget.tour.nbOudlers = n2O.index;
              });
            },
          ),
          Text("1"),
          Radio<NumberOfOudlers>(
            value: NumberOfOudlers.two,
            groupValue: n2O,
            onChanged: (NumberOfOudlers value) {
              setState(() {
                n2O = value;
                this.widget.tour.nbOudlers = n2O.index;
              });
            },
          ),
          Text("2"),
          Radio<NumberOfOudlers>(
            value: NumberOfOudlers.three,
            groupValue: n2O,
            onChanged: (NumberOfOudlers value) {
              setState(() {
                n2O = value;
                this.widget.tour.nbOudlers = n2O.index;
              });
            },
          ),
          Text("3"),
        ],
      ),
    );
  }
}

enum NumberOfOudlers { zero, one, two, three }
