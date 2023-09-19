// ignore_for_file: prefer_const_constructors, unnecessary_new, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/aluno.dart';
import '../model/aluno_repository.dart';

class AlteraAluno extends StatefulWidget {

  //define objeto que vai receber dados de página anterior
  //e índice do List que vai atualizar
  Aluno aluno;
  int indice;

  //construtor recebe objeto e atribui a aluno
  AlteraAluno(this.aluno, this.indice, {super.key});

  @override
  State<AlteraAluno> createState() => _AlteraAlunoState();
}

class _AlteraAlunoState extends State<AlteraAluno> {

  final campoRa = TextEditingController();
  final campoNome = TextEditingController();
  List listaAlunos = AlunoRepository.getListaAlunos;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final FocusNode focoRa = FocusNode();
  @override
  Widget build(BuildContext context) {
    inicializa();
    return  Scaffold(
      appBar: (AppBar(
        title: Text('Alterar dados de aluno'),
        automaticallyImplyLeading: false,)),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Form (
              key: _formKey,
              child: Column(
                children: [
                    TextFormField (
                      controller: campoRa,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      focusNode: focoRa,
                      style: TextStyle(fontSize: 15),
                      decoration:  InputDecoration (
                        labelText: 'RA',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 184, 206, 225),
                      ),
                      validator:(value){
                        if (value!.isEmpty){
                          return 'O RA não pode ser vazio';
                        } else 
                        {
                            if (int.parse(campoRa.text)<10)
                            {
                              return 'O RA deve ser maior que 10';
                            }
                        }
                        return null;
                      }, 
                    ),
                    SizedBox(height: 30),
                    TextFormField (
                      controller: campoNome,
                      style: TextStyle(fontSize: 15),
                      decoration:  InputDecoration (
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 184, 206, 225),
                      ),
                      validator: (value) {
                        if (value!.isEmpty){
                          return 'O nome não pode ser vazio';
                        }
                        else 
                        {
                            if (campoNome.text.length<5)
                            {
                              return 'O nome deve ter pelo menos 5 caracteres';
                            }
                        }
                        return null;
                      }, 
                    ),
                    SizedBox(height: 30),
                ]),
            ),
            SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                 if (_formKey.currentState!.validate())
                 {
                  int ra = int.parse(campoRa.text);
                  String nome = campoNome.text;
                  Aluno a = new Aluno(ra,nome);
                  listaAlunos[widget.indice]= a;
                  mostrarMsgSucesso();
                 }
                },
                child: Text('Alterar', style: TextStyle(fontSize: 15),)
              ),
              
              SizedBox(width: 20),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/lista');
                },
                child: Text('Voltar',style: TextStyle(fontSize: 15),)
              ),
            ],
          ),
          SizedBox(height: 30),
    ],),
        )
    );
  }

  void inicializa()
  {
    campoRa.text = widget.aluno.ra.toString();
    campoNome.text = widget.aluno.nome;
  }

   void mostrarMsgSucesso ()
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar (content:Text('Aluno alterado com sucesso')));
  }
}