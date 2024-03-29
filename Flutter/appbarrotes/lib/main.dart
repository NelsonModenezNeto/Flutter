import 'package:appbarrotes/basket.dart';
import 'package:appbarrotes/person.dart';
import 'package:flutter/material.dart';
import 'favorite.dart';
import 'basket.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, tryhvdh
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: const MyHome(),
      routes: {
        '/': (context) => MyHome(),
        '/person': (context) => Person(),
        '/basket':(context) => Basket(),
        '/favorite':(context) => Favorite(),
      },
    );
  }
}
