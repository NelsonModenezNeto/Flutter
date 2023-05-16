// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'my_dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Bem Vindo"),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              MyDog(
                  "Bem Vindo(a) à aula de desenvovimento de aplicativos para dispositivos móveis",
                  Colors.transparent,
                  18,
                  1),
              SizedBox(height: 60),
              MyDog("Aqui você pode encontrar:", Colors.transparent, 12, 1),
              SizedBox(height: 60),
              Row(
                children: [
                  Image.network(
                    "https://www.thinkdata.com.br/wp-content/uploads/2019/02/think-data-lanca-solucao-de-checagem-de-enderecos-com-foco-na-concessao-de-credito-televendas-cobranca.jpg",
                    width: 50,
                    height: 50,
                  ),
                  MyDog("Tomé", Colors.blue, 50, 30),
                  SizedBox(height: 30),
                  Image.network(
                    "https://www.thinkdata.com.br/wp-content/uploads/2019/02/think-data-lanca-solucao-de-checagem-de-enderecos-com-foco-na-concessao-de-credito-televendas-cobranca.jpg",
                    width: 50,
                    height: 50,
                  ),
                  MyDog("Tomé", Colors.blue, 50, 30),
                  SizedBox(height: 30),
                  Image.network(
                    "https://www.thinkdata.com.br/wp-content/uploads/2019/02/think-data-lanca-solucao-de-checagem-de-enderecos-com-foco-na-concessao-de-credito-televendas-cobranca.jpg",
                    width: 50,
                    height: 50,
                  ),
                  MyDog("Tomé", Colors.blue, 50, 30),
                ],
              )
            ]),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            child: SizedBox(
              height: 60,
              child: Align(
                  child: Text(
                'Venha Estudar Conosco!',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ));
  }
}
