import 'package:flutter/material.dart';

class  TextFocus extends ChangeNotifier{

  bool _focusNode=false;

  bool focusValue(){
    return _focusNode;
  }
  void changeFocusValueToTrue(){
    _focusNode = true;
    notifyListeners();
  }
  void changeFocusValueToFalse(){
    _focusNode = false;
    notifyListeners();
  }
}