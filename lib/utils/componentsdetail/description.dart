import 'package:flutter/material.dart';
import 'package:jhulyyy/constants.dart';

class Description extends StatefulWidget {
  final String eltexto;
  Description({this.eltexto});
  @override
  _DescriptionState createState() => _DescriptionState(eltextostate: eltexto);
}

class _DescriptionState extends State<Description> {
  final String eltextostate;
  _DescriptionState({this.eltextostate});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        this.eltextostate,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
