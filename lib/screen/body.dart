import 'package:flutter/material.dart';
import 'package:movies/model/familyguy.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FamilyGuy? _familyGuy;

  @override
  Widget build(BuildContext context) {
    return _familyGuy == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: Text('Data has arrived'),
          );
  }
}
