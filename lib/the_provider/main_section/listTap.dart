import 'package:flutter/cupertino.dart';

class ListTap extends ChangeNotifier{
  bool _listTap = false;

  bool getListTap(){
    return _listTap;
  }

  void changeListTap(){
    _listTap = !_listTap;
    notifyListeners();
  }

  bool _baka=false;

  bool getBaka(){
    return _baka;
  }

  void changeBaka(){
    _baka = !_baka;
    notifyListeners();
  }
}