import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  int userId = 0;
  int taskId = 0;
  String title = "";
  bool completed = false;
  Future<void> obterTarefa() async{
    final url = Url.parse('https://jsonplaceholder.typicode.com/todos/19');
    final response = await http.get(url);

    if(response.statusCode == 200){
      final data = response.body;
      Map<String, dynamic> tarefa = jsonDecode(data);
      print(tarefa);
      userId = (tarefa['userId']);
      taskId = (tarefa['id']);
      title = (tarefa['title']);;
      completed = (tarefa['completed']);
      setState(() {
        
      });
    } else{
      print('Não achei nada!!');
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}