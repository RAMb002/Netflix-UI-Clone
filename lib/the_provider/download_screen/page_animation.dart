import 'package:flutter/cupertino.dart';

class PageAnimation extends ChangeNotifier{
  bool _pageChanged = false;

  bool getPageStats()=> _pageChanged;

  void changePageStats(bool stats){
    _pageChanged = stats;
    notifyListeners();
  }
}