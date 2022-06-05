// @dart=2.9

import 'package:flutter/material.dart';
import 'tela_principal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: const Color(0xFF151026)),
            primaryColor: Color(0xFF000000),
            scaffoldBackgroundColor: Color(0xFF000000)),
        home: TelaPrincipal());
  }
}
