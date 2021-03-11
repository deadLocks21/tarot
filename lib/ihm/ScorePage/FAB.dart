import 'package:flutter/material.dart';
import 'package:tarot/ihm/TurnPage/TurnPage.dart';

class FAB extends StatefulWidget {
  FAB({Key key}) : super(key: key);

  @override
  _FABState createState() => _FABState();
}

class _FABState extends State<FAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: addTour,
    );
  }

  void addTour() {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, animation, anotherAnimation) => TurnPage(),
          transitionDuration: Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.easeInOutSine,
              parent: animation,
            );
            return SlideTransition(
              position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            );
          }),
    );
  }
}
