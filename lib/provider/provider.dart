import 'package:flutter/foundation.dart';

class MyProvider with ChangeNotifier {
  //index bottombar
  int _bottombarindex = 0;
  int get bottombarindex => _bottombarindex;
  set bottombarindex(int index) {
    _bottombarindex = index;
    notifyListeners();
  }

  //numero de mesa

  String noMesa = "2";
  String get numeromesa => noMesa;
  set mesanum(String nomesanew) {
    noMesa = nomesanew;
    notifyListeners();
  }

  //statusmesa
  bool mesaocupada = false;

  bool get statusmesa => mesaocupada;

  set mesanew(bool status) {
    mesaocupada = status;
    notifyListeners();
  }
}
