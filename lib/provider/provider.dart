import 'package:flutter/foundation.dart';

class MyProvider with ChangeNotifier {
  //index bottombar
  int _bottombarindex = 0;
  int get bottombarindex => _bottombarindex;
  set bottombarindex(int index) {
    _bottombarindex = index;
    notifyListeners();
  }
  //Userlogin state
  String _currentUser = "";
  get currentUser => _currentUser;
  set currentUser (String userNew){
    _currentUser = userNew;
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

//nombre del platillo

String _nombreplato = "";
String get nombreplato => _nombreplato;

set nombreplato (String nuevonombre){
  _nombreplato = nuevonombre;
  notifyListeners();
}

}
