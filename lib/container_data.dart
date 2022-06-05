// @dart=2.9

import 'package:flutter/material.dart';

const textStyle1 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 20.0,
);

const textStyle2 = TextStyle(
  color: Color(0xFFffaa00),
  fontSize: 32.0,
  fontWeight: FontWeight.w900,
);

const textStyle3 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 25.0,
);

class ContainerData extends StatelessWidget {
  ContainerData({@required this.icon, this.titulo});

  final IconData icon;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80, //Icon Size
          color: Colors.white, //Color Of Icon
        ),
        SizedBox(height: 15.0),
        Text(titulo, style: textStyle1),
      ],
    );
  }
}
