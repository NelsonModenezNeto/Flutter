import 'equipamentos.dart';

class EquipamentosRepository {
  static List<Equipamentos> _listEquipamentos = [];
  static get getListaAlunos => _listEquipamentos;

  set listaAlunos(value) => _listEquipamentos = value;

  void adicionar(Equipamentos equipamentos) {
    _listEquipamentos.add(equipamentos);
  }

  static void remover(Equipamentos al) {
    _listEquipamentos.remove(al);
  }

  //listar todos os alunos da lista
  void imprimir() {
    for (var i = 0; i < _listEquipamentos.length; i++) {
      print("Codigo: ${_listEquipamentos[i].codigo}, Nome: ${_listEquipamentos[i].nome}, Descrição: ${_listEquipamentos[i].descricao}, Preço: ${_listEquipamentos[i].preco}");
    }
    print("===============================");
  }
}
