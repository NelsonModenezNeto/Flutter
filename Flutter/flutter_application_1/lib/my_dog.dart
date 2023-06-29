import 'package:flutter/material.dart';

class my_dog extends StatefulWidget {
  const my_dog({Key? key});

  @override
  State<my_dog> createState() => _OperacoesState();
}

class _OperacoesState extends State<my_dog> {
  double valor1 = 0;
  double valor2 = 0;
  double resultado = 0;
  TextEditingController campoTexto = TextEditingController();
  TextEditingController campoTexto2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operações'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: campoTexto,
              onChanged: (value) {
                print(value);
              },
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                labelText: 'Valor 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: campoTexto2,
              onChanged: (value) {
                print(value);
              },
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                labelText: 'Valor 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    valor1 = double.parse(campoTexto.text);
                    valor2 = double.parse(campoTexto2.text);
                    resultado = valor1 + valor2;
                    setState(() {});
                  },
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () {
                    valor1 = double.parse(campoTexto.text);
                    valor2 = double.parse(campoTexto2.text);
                    resultado = valor1 - valor2;
                    setState(() {});
                  },
                  child: const Text("-"),
                ),
                ElevatedButton(
                  onPressed: () {
                    valor1 = double.parse(campoTexto.text);
                    valor2 = double.parse(campoTexto2.text);
                    resultado = valor1 * valor2;
                    setState(() {});
                  },
                  child: const Text("*"),
                ),
                ElevatedButton(
                  onPressed: () {
                    valor1 = double.parse(campoTexto.text);
                    valor2 = double.parse(campoTexto2.text);
                    resultado = valor1 / valor2;
                    setState(() {});
                  },
                  child: const Text("/"),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                resultado = 0;
                campoTexto.clear();
                campoTexto2.clear();
                setState(() {});
              },
              child: const Text("CE"),
            ),
            SizedBox(height: 10),
            Text("O resultado é $resultado"),
          ],
        ),
      ),
    );
  }
}