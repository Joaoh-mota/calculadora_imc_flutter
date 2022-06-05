// @dart=2.9

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc/container_data.dart';
import 'package:imc/tela_principal.dart';

class TelaResultado extends StatelessWidget {
  final int peso;
  final int altura;
  final int idade;

  TelaResultado({this.altura, this.peso, this.idade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Resultado'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Result(this.altura, this.peso, this.idade),
    );
  }
}

class Result extends StatefulWidget {
  final int altura;
  final int peso;
  final int idade;

  Result(this.altura, this.peso, this.idade);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: corDesativada),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Seu Imc',
                    style: textStyle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(calculaImc(this.widget.peso, this.widget.altura),
                      style: textStyle2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    interpretarImc(imc, this.widget.idade),
                    style: textStyle3,
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: corAtivada,
            margin: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text('Calcular novamente'),
            ),
          ),
        ),
      ],
    );
  }
}

double imc = 0;

String resultado = '';
String detalheResultado = '';

String calculaImc(int peso, int altura) {
  imc = peso / pow(altura / 100, 2);
  return imc.toStringAsFixed(1);
}

String interpretarImc(double imc, int idade) {
  if (idade > 59) {
    if (imc >= 27) {
      return 'Acima do peso';
    } else if (imc > 22) {
      return 'Peso normal';
    } else {
      return 'Abaixo do peso';
    }
  } else if (idade < 59 && idade > 18) {
    if (imc >= 25) {
      return 'Acima do peso';
    } else if (imc > 18.5) {
      return 'Peso normal';
    } else {
      return 'Abaixo do peso';
    }
  } else {
    if (imc >= 20) {
      return 'Acima do peso';
    } else if (imc > 14.5) {
      return 'Peso normal';
    } else {
      return 'Abaixo do peso';
    }
  }
}
