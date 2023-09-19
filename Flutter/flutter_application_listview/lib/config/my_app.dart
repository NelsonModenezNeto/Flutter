// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_formularios2/pages/cadastro_aluno_page.dart';
import 'package:flutter_application_formularios2/pages/lista_aluno_page.dart';

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
        '/':(context) => CadastroAlunoPage(),
        '/lista':(context) => ListaAlunosPage(),
        //'/altera':(context) => AlteraAluno(),
      },
    );
  }
}