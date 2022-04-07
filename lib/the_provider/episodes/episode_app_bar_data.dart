import 'package:flutter/cupertino.dart';

class EpisodeAppBarData extends ChangeNotifier{

  bool _showAppbar = true;
  bool _isScrollingDown = false;
  double _offset = 0;



  bool showAppBar(){
    return _showAppbar;
  }

  void changeOffsetValueToZero(){
    _offset =0;
    notifyListeners();
  }

  void changeAppBarValue(){
    _showAppbar = !_showAppbar;
    notifyListeners();
  }
  bool isScrollingDown(){
    return _isScrollingDown;
  }

  void changeIsScrollingDownValue(){
    _isScrollingDown = ! _isScrollingDown;
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