import 'package:flutter/cupertino.dart';

class Scroll extends ChangeNotifier{
  double _offset = 0;


  void changeOffsetValueToZero(){
    _offset =0;
    notifyListeners();
  }

  double offsetValue(){
    return _offset;
  }

  void changeOffSetValue(ScrollController scrollController){
    _offset = scrollController.offset;
    // print(_offset);
    notifyListeners();
  }
}