import 'my_dog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      routes: {
        '/operacoes': (context) => const my_dog(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operação'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/my_dog');
            },
            icon: const Icon(Icons.numbers_rounded),
          ),
        ],
      ),
      body: Center(
        child: Text('Página inicial'),
      ),
    );
  }
}