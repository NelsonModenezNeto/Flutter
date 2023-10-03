// ignore_for_file: prefer_const_constructors

import 'package:crudequipamentos/pages/cadastro.dart';
import 'package:crudequipamentos/pages/listaequi.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const CadastroAlunoPage(),
      routes: {
        '/':(context) => CadastrarEquiPage(),
        '/lista':(context) => ListaEquiPage(),
        //'/altera':(context) => AlteraAluno(),
      },
    );
  }
}