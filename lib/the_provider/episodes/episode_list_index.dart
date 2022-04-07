import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/data/content_model.dart';

class EpisodeListIndex extends ChangeNotifier{

  List<Content> _list =[];
  int _listIndex = 0;



  List<Content> getList(){
    return _list;
  }
  int getListIndex(){
    return _listIndex;
  }
  void changeList(List<Content> list){
    _list = list;
    notifyListeners();
  }

  void changeIndex(int index){
    _listIndex = index;
    notifyListeners();
  }

}