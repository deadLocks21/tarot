import 'package:flutter/material.dart';

class ScoreDivider extends StatelessWidget {
  const ScoreDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Divider(
        color: Colors.black45,
        thickness: 2,
      ),
    );
  }
}
