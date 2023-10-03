// ignore_for_file: unused_field, unnecessary_this
class Equipamentos {
  int _codigo;
  String _nome;
  String _descricao;
  double _preco;

  Equipamentos(this._codigo, this._nome, this._descricao, this._preco);

  get codigo => this._codigo;

  set codigo(final value) => this._codigo = value;

  get nome => this._nome;

  set nome(value) => this._nome = value;

  get descricao => this._descricao;

  set descricao(final value) => this._descricao = value;

  get preco => this._preco;

  set preco(value) => this._preco = value;
  
}
