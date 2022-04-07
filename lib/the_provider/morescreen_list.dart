import 'package:flutter/cupertino.dart';

class MoreScreenList extends ChangeNotifier{
  bool _moreOnTapList = false;

  bool getMoreOnTapList(){
    return _moreOnTapList;
  }

  void changeMoreOnTapList(){
    _moreOnTapList = !_moreOnTapList;
    notifyListeners();
  }

}