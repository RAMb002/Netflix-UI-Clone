import 'package:flutter/cupertino.dart';

class MyListSlideAnimation extends ChangeNotifier{
  int _slideTransitionAnimationEnd =0;

  int getslideTransitionAnimationEnd(){
    return _slideTransitionAnimationEnd;
  }

  void changeSlideTransitionAnimationEnd(int number){
    _slideTransitionAnimationEnd = number;
    notifyListeners();
  }
}