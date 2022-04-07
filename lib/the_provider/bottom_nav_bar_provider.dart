import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBarProvider extends ChangeNotifier{

  int _index =0;

  int _countHome=0, _countSearch=0, _countComingSoon=0 , _countDownloads =0, _countMore=0;
  List<int> _list =[];

  List<int> getList(){
    // print(_list);
    return _list;
  }

  void clearList(){
    _list.clear();
    notifyListeners();
  }

  void addIndexInList(int index){
    _list.add(index);
    notifyListeners();
  }

  int getLastIndexValueInList(){
    // print(_list.last);
    return _list.last;
  }
  void removeLastIndex(){
    _list.removeLast();
    notifyListeners();
  }
  int indexValue(){
    return _index;
  }

  void changeIndexValue(int newIndex){
    _index = newIndex;
    notifyListeners();
  }

  // int countHome(){
  //   return _countHome;
  // }
  //
  // void changeCountHome(int count){
  //   _countHome = count;
  //   notifyListeners();
  //
  // }
  //
  // int countSearch(){
  //   return _countSearch;
  // }
  // void changeCountSearch(int count){
  //   _countSearch = count;
  //   notifyListeners();
  // }
  //
  // int countComingSoon(){
  //   return _countComingSoon;
  // }
  //
  // void changeCountComingSoon(int count){
  //   _countComingSoon = count;
  //   notifyListeners();
  // }
  //
  // int countDownloads(){
  //   return _countDownloads;
  // }
  //
  // void changeCountDownloads(int count){
  //   _countDownloads = count;
  //   notifyListeners();
  // }
  //
  // int countMore(){
  //   return _countMore;
  // }
  //
  // void changeCountMore(int count){
  //   _countMore = count;
  //   notifyListeners();
  // }





}