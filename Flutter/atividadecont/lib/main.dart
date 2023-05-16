import 'package:flutter/material.dart';
import 'class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Contador cont = Contador();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bem Vindo'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://media.istockphoto.com/id/1173585579/pt/foto/brigadier.jpg?s=612x612&w=0&k=20&c=huBBKQPsrmdntZbdmUOKvP_C_VY2RJsfFivRSTJ9kcA=",
                width: 100,
                height: 100,
              ),
              Text(
                'Contador:',
              ),
              Text(
                cont.getContador().toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    child: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        cont.subtrair();
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        cont.somar();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
