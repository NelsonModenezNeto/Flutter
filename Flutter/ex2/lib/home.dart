import 'package:ex2/about.dart';
import 'package:ex2/cont.dart';
import 'package:ex2/welcome.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indice = 0;

  List<Widget> _telas = [
        Welcome(),
        Cont(),
        About(),
  ];

  void _itemClicado(int index) {
    setState(() {
      _indice = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Home"),
    ),
     body: _telas [_indice],
     bottomNavigationBar: BottomNavigationBar(
      currentIndex: _indice,
      onTap: _itemClicado,
      items: [
          BottomNavigationBarItem(
          icon: Icon (Icons.person),
          label: "Welcome",
          ),
          BottomNavigationBarItem(
          icon: Icon (Icons.shopping_basket_outlined),
          label: "Cont",
          ),
          BottomNavigationBarItem(
          icon: Icon (Icons.favorite),
          label: "About",
          )
      ]),
    );
  }
}
