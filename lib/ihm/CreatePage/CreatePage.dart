import 'package:flutter/material.dart';
import 'package:tarot/ihm/CreatePage/Body.dart';

class CreatePage extends StatefulWidget {
  CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context, false),
      ),
      title: Text("Création de la partie"),
    );
  }
}
