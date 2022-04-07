import 'package:flutter/cupertino.dart';

class MyList extends ChangeNotifier{

  bool _tick = false;
  int _index =0;

  int _slideValue=0;

  int getSlideValue(){
    return _slideValue;
  }

  void changeSlideValue(int newSlideValue){
    _slideValue = newSlideValue;
    notifyListeners();
  }

  int getIndex(){
    return _index;
  }

  void changeIndex(int index){
    _index = index;
    notifyListeners();
  }

  bool getTickValue(){
    return _tick;
  }

  void changeTickValueToTrue(){
    _tick =true;
    notifyListeners();
  }

  void changeTickValueToFalse(){
    _tick =false;
    notifyListeners();
  }
}