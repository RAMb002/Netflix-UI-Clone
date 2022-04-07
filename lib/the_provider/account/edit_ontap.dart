import 'package:flutter/cupertino.dart';

class EditOnTap extends ChangeNotifier{
  bool _editOnTap = false;
  bool _mainScreenListPageTap = false;

  bool getMainScreenListPageTap(){
    return _mainScreenListPageTap;
  }
  void changeMainScreenListPageTap(){
    _mainScreenListPageTap = !_mainScreenListPageTap;
    notifyListeners();
  }

  bool getEditOnTap(){
    return _editOnTap;
  }

  void changeEditOnTap(){
    _editOnTap = !_editOnTap;
    notifyListeners();
  }
}