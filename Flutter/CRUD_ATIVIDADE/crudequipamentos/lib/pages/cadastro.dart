// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_this, prefer_final_fields, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/equipamentos.dart';
import '../model/equipamentos_repo.dart';

class CadastrarEquiPage extends StatefulWidget {
  const CadastrarEquiPage({super.key});

  @override
  State<CadastrarEquiPage> createState() => _CadastrarEquiPageState();
}

class _CadastrarEquiPageState extends State<CadastrarEquiPage> {
  final campoCodigo = TextEditingController();
  final campoNome = TextEditingController();
  final campoDescricao = TextEditingController();
  final campoPreco = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  EquipamentosRepository alRepo = new EquipamentosRepository();
  final FocusNode focoCodigo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (Text("Cadastro de Equipamentos")),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lista');
                },
                icon: Icon(Icons.list_alt_rounded))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2019/04/14/10/27/book-4126483__480.jpg')),
              SizedBox(height: 30),
              Form(
                key: this._formKey,
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
                        return 'O código não pode ser vazio';
                      } else {
                        if (int.parse(campoCodigo.text) < 2) {
                          return 'O código deve ser maior que 2';
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
                        return 'O nome não pode ser vazio';
                      } else {
                        if (campoNome.text.length >= 400) {
                          return 'A descrição deve ter menos de 400 caracteres';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: campoPreco,
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
                        if (double.parse(campoPreco.text) > 10000) {
                          return 'O preço deve ser menor que 10000 Reais';
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
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          int ra = int.parse(campoCodigo.text);
                          String nome = campoNome.text;
                          String descricao = campoDescricao.text;
                          double preco = double.parse(campoPreco.text);
                          Equipamentos a = new Equipamentos(ra, nome, descricao, preco);
                          alRepo.adicionar(a);
                          alRepo.imprimir();
                          limparCampos();
                          mostrarMsgSucesso();
                          setState(() {});
                        }
                      },
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 15),
                      )),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        limparCampos();
                        _formKey.currentState!.reset();
                        setState(() {});
                      },
                      child: Text(
                        'Limpar',
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }

  void limparCampos() {
    campoCodigo.clear();
    campoNome.clear();
    campoDescricao.clear();
    campoPreco.clear();
    focoCodigo.requestFocus();
  }

  void mostrarMsgSucesso() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Equipamento cadastrado com sucesso')));
  }
}
