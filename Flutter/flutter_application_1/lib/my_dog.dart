
import 'dart:ffi';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyDog extends StatelessWidget {

  //atributos
  final String nome;
  final Color cor;
  final double tamanhoTexto; 
  final double tamanhoBorda;

  const MyDog(this.nome,  this.cor,  this.tamanhoTexto,  this.tamanhoBorda, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: cor),
        child: Padding(
          padding: EdgeInsets.all(tamanhoBorda),
          child: Text(nome, style: TextStyle(fontSize: tamanhoTexto),
        )));
  }
}
