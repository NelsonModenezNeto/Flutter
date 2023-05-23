import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              ClipOval(
                child: Image.network(
                  "https://img.freepik.com/fotos-gratis/empresario-prospero-mantem-as-maos-cruzadas-tem-expressao-satisfeita_273609-16711.jpg",
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  "Monteiro Lobato (1882-1948) foi um escritor e editor brasileiro. O Sítio do Pica-pau Amarelo é sua obra de maior destaque na literatura infantil. Criou a Editora Monteiro Lobato e mais tarde a Companhia Editora Nacional. Foi um dos primeiros autores de literatura infantil de nosso país e de toda a América Latina. Ao lado da literatura infantil, Monteiro Lobato também deixou uma extensa obra voltada para o público adulto. Retratou os vilarejos decadentes e a população do Vale do Paraíba, quando da crise do café.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
