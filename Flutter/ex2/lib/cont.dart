import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';



import 'package:flutter/material.dart';

class Cont extends StatefulWidget {
  const Cont({super.key});

  @override
  _ContState createState() => _ContState();
}

class _ContState extends State<Cont> {
  int _contador = 0;

  void somar() {
    setState(() {
      _contador++;
    });
  }

  void subtrair() {
    setState(() {
      if(_contador == 0){
        _contador == 0;
      }
      else{
      _contador--;
      }
    });
  }

  int getContador() {
    return _contador;
  }

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
                getContador().toString(),
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
                        subtrair();
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        somar();
                      });
                    },
                  ),
                ],
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(height: 80),
                Text("O número de brigadeiros é: "+ getContador().toString(),
                style: TextStyle(fontSize: 18),
                )
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
