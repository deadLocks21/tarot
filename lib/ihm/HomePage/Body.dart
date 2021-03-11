import 'package:flutter/material.dart';
import 'package:tarot/ihm/CreatePage/CreatePage.dart';
import 'package:tarot/ihm/ScorePage/ScorePage.dart';
import 'package:tarot/logic/Partie.dart';
import 'package:tarot/logic/Tarot.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Text('Nouvelle partie'),
              onPressed: () async {
                Tarot.partieEnCreation = new Partie();

                var result = false;
                result = await Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (context, animation, anotherAnimation) =>
                          CreatePage(),
                      transitionDuration: Duration(milliseconds: 400),
                      transitionsBuilder:
                          (context, animation, anotherAnimation, child) {
                        animation = CurvedAnimation(
                          curve: Curves.easeInOutSine,
                          parent: animation,
                        );
                        return SlideTransition(
                          position: Tween(
                                  begin: Offset(1.0, 0.0),
                                  end: Offset(0.0, 0.0))
                              .animate(animation),
                          child: child,
                        );
                      }),
                );

                if (result) _transitionScorePage();
              },
            ),
            Container(
              child: Image.asset("assets/cards.png"),
              height: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            ValueListenableBuilder(
                valueListenable: Tarot.partieEnCoursVN,
                builder: (BuildContext context, Partie value, Widget widget) {
                  return OutlinedButton(
                    child: Text('Reprendre une partie'),
                    onPressed: Tarot.partieEnCours != null ? restart : null,
                  );
                }),
          ],
        ),
      ),
    );
  }

  void restart() {
    _transitionScorePage();
  }

  void _transitionScorePage() {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, animation, anotherAnimation) => ScorePage(),
          transitionDuration: Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.easeInOutSine,
              parent: animation,
            );
            return SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            );
          }),
    );
  }
}
