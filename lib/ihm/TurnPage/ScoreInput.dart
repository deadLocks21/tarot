import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarot/logic/Tour.dart';

class ScoreInput extends StatefulWidget {
  Tour tour;
  ScoreInput({Key key, this.tour}) : super(key: key);

  @override
  _ScoreInputState createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  TextEditingController _controller;
  String _error = "";

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = "0";
    this.widget.tour.score = 0;
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Score',
          errorText: _error != "" ? _error : null,
        ),
        onChanged: (value) {
          int score = int.parse(value);
          setState(() {
            if (value == "")
              _error = "Le score ne peut pas être nul ...";
            else if (score > 91)
              _error = "Ca fait beaucoup de points nan ? (max = 91)";
            else if (score < 0)
              _error = "Ca fait pas beaucoup de points na ? (min = 0)";
            else {
              _error = "";
              this.widget.tour.score = score;
            }
          });
        },
      ),
    );
  }
}
