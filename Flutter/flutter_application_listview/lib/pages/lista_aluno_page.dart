// ignore_for_file: prefer_const_constructors, avoid_print


import 'package:flutter/material.dart';
import 'package:flutter_application_formularios2/model/aluno_repository.dart';
import 'package:flutter_application_formularios2/pages/altera_aluno.dart';

import '../model/aluno.dart';





class ListaAlunosPage extends StatefulWidget {
   const ListaAlunosPage({super.key});

  @override
  State<ListaAlunosPage> createState() => _ListaAlunosPageState();
}

class _ListaAlunosPageState extends State<ListaAlunosPage> {

  //obtem lista de AluoRepository (get)
  List <Aluno> listaAlunos = AlunoRepository.getListaAlunos;

  //faz uma cópia da lista original de alunos que vem de Repository
  List<Aluno> listaBusca = [];

  //quando deleta aluno da lista original, precisa manter o nome digitado no campo de busca
  String nomeBusca="";
  
  @override
  void initState() {
    //cópia da lista original
    listaBusca = List.from(listaAlunos);
    super.initState();
  }

  void atualizaLista (String nome)
  {
    listaBusca = List.from(listaAlunos);
    setState(() {
      //seleciona somente os alunos com nome igual ao da busca e grava na cópia
      listaBusca = listaAlunos.where((element) => (
        element.nome.toLowerCase().contains(nome.toLowerCase()))).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: (AppBar(
        title: Text('Lista de Alunos'),
        automaticallyImplyLeading: false,)),
      body: Column(children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(width:350, height:30, 
              child: TextField (
                style: TextStyle(fontSize: 15),
                decoration:  InputDecoration (
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 184, 206, 225),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (String nome) {
                  //guarda string do campo de busca caso seja necessário usar na exclusão
                  nomeBusca = nome;
                  atualizaLista(nomeBusca);
                },
            )
            ),
        ]),
        SizedBox(height: 30),
        Divider(thickness: 2,),
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (contex, index) => Divider(thickness: 2,), 
          itemCount: listaBusca.length,
          itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar (child: Text(listaBusca[index].nome[0]),),
            title: Text(listaBusca[index].nome),
            subtitle: Text(listaBusca[index].ra.toString()),
            trailing: SizedBox (
              width:70,
              child: Row (children: [
                Expanded(child: IconButton(onPressed: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder:(context) {
                      return AlteraAluno(listaBusca[index], index);
                    },));
                }, icon: Icon(Icons.edit))),
                Expanded(child: IconButton(onPressed: () {
                  Aluno al = listaAlunos[index];
                  AlunoRepository.remover(al);
                  //após remover o aluno da lista original, chama método para atualizar a cópia
                  atualizaLista(nomeBusca);
                  setState(() {
                    
                  });
                }, icon: Icon(Icons.delete))),
              ]),)
          );
        }, 
        padding: EdgeInsets.all(7),
        ),
        Divider(thickness: 2,),
        ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, '/');
        }, 
          child: Text("Voltar")),
        
      ])
    );
  }
}