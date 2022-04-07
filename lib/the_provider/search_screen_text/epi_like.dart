import 'package:flutter/widgets.dart';

class EpiLike extends ChangeNotifier{
  bool like = false;

  void changeLike(bool value){
    like = value;
    notifyListeners();
  }
}