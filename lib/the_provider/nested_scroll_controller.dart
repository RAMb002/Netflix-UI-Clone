import 'package:flutter/cupertino.dart';

class NestedScrollController extends ChangeNotifier{

  ScrollController _scrollController = ScrollController();

  ScrollController getScrollController(){
    return _scrollController;
  }

  void changeScrollValueToZero(){

    _scrollController.animateTo(0,duration: Duration(milliseconds: 500),curve: Curves.linear);
    notifyListeners();
  }


}