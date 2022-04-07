import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListProvider extends ChangeNotifier{

  bool _onTapMyList = false;
  bool _onTapIcon = false;

  bool getOnTapIconValue(){
    return _onTapIcon;
  }
  void changeOnTapIconValue(){
    _onTapIcon = !_onTapIcon;
    notifyListeners();
  }

  bool onTapMyListValue(){
    return _onTapMyList;
  }

  void changeOnTapMyListValueToTrue(){
    _onTapMyList = true;
    notifyListeners();
  }

  void changeOnTapMyListValueToFalse(){
    _onTapMyList = false;
    notifyListeners();
  }



}