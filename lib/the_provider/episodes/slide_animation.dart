import 'package:flutter/cupertino.dart';

class SlideAnimation extends ChangeNotifier{

  int _slideTransitionAnimationEnd =0;

  int getslideTransitionAnimationEnd(){
    return _slideTransitionAnimationEnd;
  }

  void changeSlideTransitionAnimationEnd(int number){
    _slideTransitionAnimationEnd = number;
    notifyListeners();
  }
}