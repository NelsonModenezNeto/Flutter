// ignore_for_file: prefer_const_constructors, unnecessary_new, must_be_immutable

import 'package:crudequipamentos/model/equipamentos.dart';
import 'package:crudequipamentos/model/equipamentos_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlteraEquipamento extends StatefulWidget {
  //define objeto que vai receber dados de página anterior
  //e índice do List que vai atualizar
  Equipamentos equipamento;
  int indice;

  //construtor recebe objeto e atribui a aluno
  AlteraEquipamento(this.equipamento, this.indice, {super.key});

  @override
  State<AlteraEquipamento> createState() => _AlteraEquipamentoState();
}

class _AlteraEquipamentoState extends State<AlteraEquipamento> {
  final campoCodigo = TextEditingController();
  final campoNome = TextEditingController();
  final campoDescricao = TextEditingController();
  final campoPreco = TextEditingController();
  List listaAlunos = EquipamentosRepository.getListaAlunos;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final FocusNode focoCodigo = FocusNode();
  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
        appBar: (AppBar(
          title: Text('Alterar dados de equipamentos'),
          automaticallyImplyLeading: false,
        )),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    controller: campoCodigo,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    focusNode: focoCodigo,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Código',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromARGB(255, 184, 206, 225),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O Código não pode ser vazio';
                      } else {
                        if (int.parse(campoCodigo.text) < 10) {
                          return 'O Código deve ser maior que 10';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: campoNome,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromARGB(255, 184, 206, 225),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O nome não pode ser vazio';
                      } else {
                        if (campoNome.text.length < 5) {
                          return 'O nome deve ter pelo menos 5 caracteres';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: campoDescricao,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromARGB(255, 184, 206, 225),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'A Descrição não pode ser vazio';
                      } else {
                        if (campoNome.text.length < 5) {
                          return 'A Descrição deve ter pelo menos 5 caracteres';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: campoPreco,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    focusNode: focoCodigo,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Preço',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromARGB(255, 184, 206, 225),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O Preço não pode ser vazio';
                      } else {
                        if (int.parse(campoCodigo.text) < 1) {
                          return 'O Preço deve ser maior que 10';
                        }
                      }
                      return null;
                    },
                  ),
                ]),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          int codigo = int.parse(campoCodigo.text);
                          String nome = campoNome.text;
                          double preco = double.parse(campoPreco.text);
                          String descricao = campoDescricao.text;
                          Equipamentos a = new Equipamentos(codigo, nome, descricao, preco);
                          listaAlunos[widget.indice] = a;
                          mostrarMsgSucesso();
                        }
                      },
                      child: Text(
                        'Alterar',
                        style: TextStyle(fontSize: 15),
                      )),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/lista');
                      },
                      child: Text(
                        'Voltar',
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }

  void inicializa() {
    campoCodigo.text = widget.equipamento.codigo.toString();
    campoNome.text = widget.equipamento.nome;
    campoDescricao.text = widget.equipamento.descricao;
    campoPreco.text = widget.equipamento.preco.toString();
  }

  void mostrarMsgSucesso() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Equipamento alterado com sucesso')));
  }
}
