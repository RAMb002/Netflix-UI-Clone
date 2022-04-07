import 'package:flutter/cupertino.dart';

class EpisodeNavigation extends ChangeNotifier{

  int _index=0;

  int getNavigationIndex(){
    return _index;
  }

  void changeNavigationIndex(int index){
    _index = index;
    notifyListeners();
  }

}