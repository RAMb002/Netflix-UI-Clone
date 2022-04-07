import 'package:flutter/cupertino.dart';

class ActiveAccount extends ChangeNotifier{
  String _activeName ='';

  String getActiveName(){
    return _activeName;
  }

  void changeActiveName(String name){
    _activeName = name;
    notifyListeners();
  }
}