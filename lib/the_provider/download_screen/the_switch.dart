import 'package:flutter/cupertino.dart';

class TheSwitch extends ChangeNotifier{
  bool _switch = false;

  bool getSwitch() => _switch;

  void changeSwitch(bool onChanged){
    _switch = onChanged;
    notifyListeners();
  }
}