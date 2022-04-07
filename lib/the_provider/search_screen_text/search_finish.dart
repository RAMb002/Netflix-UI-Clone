import 'package:flutter/cupertino.dart';

class SearchFinish extends ChangeNotifier{
  bool _finish = false;

  bool getFinish()=> _finish;

  void changeFinish(bool change){
    _finish =change;
    notifyListeners();
  }
}