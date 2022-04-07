import 'package:flutter/cupertino.dart';

class EpiIndex extends ChangeNotifier{
  int _index=0;

  int getEpiIndex() =>_index;

  void changeEpiIndex(int index){
    _index = index;
    notifyListeners();
  }
}