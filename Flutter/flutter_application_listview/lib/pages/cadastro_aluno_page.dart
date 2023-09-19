// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_this, prefer_final_fields, sort_child_properties_last


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_formularios2/model/aluno.dart';
import 'package:flutter_application_formularios2/model/aluno_repository.dart';


class CadastroAlunoPage extends StatefulWidget {
  const CadastroAlunoPage({super.key});



  @override
  State<CadastroAlunoPage> createState() => _CadastroAlunoPageState();
}

class _CadastroAlunoPageState extends State<CadastroAlunoPage> {
  final campoRa = TextEditingController();
  final campoNome = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  AlunoRepository alRepo = new AlunoRepository();
  final FocusNode focoRa = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Cadastro de Alunos")),
        actions: [
          IconButton(onPressed: ()
          {
            Navigator.pushNamed(context, '/lista');
          }, icon: Icon(Icons.list_alt_rounded))
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(child: Image.network('https://cdn.pixabay.com/photo/2019/04/14/10/27/book-4126483__480.jpg')),
            SizedBox(height: 30),
            Form (
              key: this._formKey,
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
                  alRepo.adicionar(a);
                  alRepo.imprimir();
                  limparCampos();
                  mostrarMsgSucesso();
                  setState(() {
                    
                  });
                 }
                 
                },
                child: Text('Cadastrar', style: TextStyle(fontSize: 15),)
              ),
              
              SizedBox(width: 20),
              ElevatedButton(onPressed: (){
                limparCampos();
                _formKey.currentState!.reset();
                setState(() {
                    
                  });
                },
                child: Text('Limpar',style: TextStyle(fontSize: 15),)
              ),
            ],
          ),
          SizedBox(height: 30),
          ],),
        )
    );
  }

  void limparCampos()
  {
    campoRa.clear();
    campoNome.clear();
    focoRa.requestFocus();
  }

  void mostrarMsgSucesso ()
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar (content:Text('Aluno cadastrado com sucesso')));
  }
}
