// ignore_for_file: unused_field, prefer_final_fields, unnecessary_this, avoid_print

import 'package:flutter_application_formularios2/model/aluno.dart';

class AlunoRepository 
{
  //atributo
  static List<Aluno> _listaAlunos =[];

  static get getListaAlunos => _listaAlunos;

  set listaAlunos(value) => _listaAlunos = value;
 
  //adicionar Aluno à lista
  void adicionar (Aluno aluno)
  {
    _listaAlunos.add(aluno);
  }

  static void remover (Aluno al)
  {
    _listaAlunos.remove(al);
  }

  //listar todos os alunos da lista
  void imprimir ()
  {
    for (var i =0; i<_listaAlunos.length; i++)
    {
      print ("RA: ${_listaAlunos[i].ra}, Nome: ${_listaAlunos[i].nome}");
    }
    print ("===============================");
  }

  //getters e setters
  
  
 


}