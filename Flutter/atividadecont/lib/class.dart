import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Contador
{
  int _contador = 0;

  void somar()
  {
    _contador++;
  }
  void subtrair()
  {
    _contador--;
  }
  int getContador()
  {
    return _contador;
  }
}
