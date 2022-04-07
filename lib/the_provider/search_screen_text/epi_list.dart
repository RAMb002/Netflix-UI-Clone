import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpiList extends ChangeNotifier{
  bool _baka = false;
 bool getBaka()=> _baka;
  void changeBaka(){
    _baka = false;
    notifyListeners();
  }
}