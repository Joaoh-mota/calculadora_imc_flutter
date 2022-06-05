// @dart=2.9
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_box.dart';
import 'container_data.dart';
import 'tela_resultado.dart';

const corAtivada = Color(0xFFffaa00);
const corDesativada = Color(0xFF202020);

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Color corBoxMasculino = corAtivada;
  Color corBoxFeminino = corDesativada;
  int altura = 160;
  int peso = 40;
  int idade = 0;
  String resultado = '';
  String detalheResultado = "Resultado";
  double imc = 0;

  void atualizarCorBox(int sexo) {
    if (sexo == 0) {
      if (corBoxMasculino == corDesativada) {
        corBoxMasculino = corAtivada;
        corBoxFeminino = corDesativada;
      } else {
        corBoxMasculino = corDesativada;
      }
    } else {
      if (corBoxFeminino == corDesativada) {
        corBoxFeminino = corAtivada;
        corBoxMasculino = corDesativada;
      } else {
        corBoxFeminino = corDesativada;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULA IMC"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      atualizarCorBox(0);
                    });
                  },
                  child: ContainerBox(
                    boxColor: corBoxMasculino,
                    childWidget: ContainerData(
                      icon: FontAwesomeIcons.mars,
                      titulo: "Masculino",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      atualizarCorBox(1);
                    });
                  },
                  child: ContainerBox(
                    boxColor: corBoxFeminino,
                    childWidget: ContainerData(
                      icon: FontAwesomeIcons.venus,
                      titulo: "Feminino",
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ContainerBox(
              boxColor: corDesativada,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Altura',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        altura.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        'cm',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: altura.toDouble(),
                    min: 100,
                    max: 220,
                    activeColor: corAtivada,
                    inactiveColor: corDesativada,
                    onChanged: (double novoValor) {
                      setState(() {
                        altura = novoValor.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                  boxColor: corDesativada,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Peso',
                        style: textStyle1,
                      ),
                      Text(
                        peso.toString(),
                        style: textStyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              setState(() {
                                if (peso > 0) {
                                  peso--;
                                }
                              });
                            },
                            backgroundColor: corAtivada,
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              setState(() {
                                peso++;
                              });
                            },
                            backgroundColor: corAtivada,
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ContainerBox(
                  boxColor: corDesativada,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Idade',
                        style: textStyle1,
                      ),
                      Text(
                        idade.toString(),
                        style: textStyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              setState(() {
                                if (idade > 0) {
                                  idade--;
                                }
                              });
                            },
                            backgroundColor: corAtivada,
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              setState(() {
                                idade++;
                              });
                            },
                            backgroundColor: corAtivada,
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaResultado(
                          altura: altura, peso: peso, idade: idade)));
            },
            child: Container(
                child: Center(
                  child: Text(
                    'Calcular',
                    style: textStyle3,
                  ),
                ),
                width: double.infinity,
                height: 80.0,
                color: corAtivada,
                margin: EdgeInsets.only(top: 10.0)),
          )
        ],
      ),
    );
  }
}
