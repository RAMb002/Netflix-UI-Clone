import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/the_provider/search_screen_text/the_text.dart';
import 'package:netflix_clone/screens/main_screens/search_screen/search_widget.dart';
import 'dart:math';
import 'package:netflix_clone/data/Data.dart';

class ListStacks extends ChangeNotifier {
  // String generateRandomString(int len) {
  //  var r = Random();
  //  String randomString =String.fromCharCodes(List.generate(len, (index)=> r.nextInt(33) + 89));
  //  return randomString;
  //
  // }

   PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  PageController getPageController() => _pageController;

  void changePageController(PageController pageController){
    _pageController = pageController;
    notifyListeners();
  }

  //
  //  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  //
  // GlobalKey<AnimatedListState> getKey(){
  //  return _listKey;
  // }

  // void insertElement(){
  //  _listKey.currentState?.insertItem(widgetList.length-1,duration: Duration(seconds: 3));
  //  notifyListeners();
  // }

  bool _hide = false;

  int _count = 0;
  int _cloneCount = 0;

//  int getCloneCount() => _cloneCount;
//  void changeCloneCount(int number){
//   _cloneCount = number;
//   notifyListeners();
//  }
//
//  List<ValueKey> _keys=[ValueKey('jgdkrn')];
//  //
//  // ValueKey getKey(){
//  //  return _keys[_count];
//  // }
//
//  List<ValueKey> getKeyList(){
//   return _keys;
//  }
//
//  ValueKey getLastKey(){
//   return _keys.last;
//  }
//
//
//
//  int getCount() => _count;
//
//  void incrementCount(){
//   _count++;
//   String randomKey =generateRandomString(6);
//   _keys.add(ValueKey(randomKey));
//
//   notifyListeners();
//  }
//
//  void decrementCount(){
//   if(_count!=0){
//    _count--;
//    notifyListeners();
//   }
//  }
//
//  List<double> _offsets=[0];
//
//  List<double> getOffsetList(){
//   return _offsets;
//  }
//
//  void removeElementInOffsetList(){
//   _offsets.removeAt(_count);
//   notifyListeners();
//  }
//
//  void addOffsetOne(){
//   _offsets.add(1);
//   notifyListeners();
//  }
//
//  void changeOffsetToZero(){
//   _offsets.last=0;
//   notifyListeners();
//  }
//
//  void changeOffsetToOneHide(){
//   _offsets.last=1;
//   notifyListeners();
//  }
//
//  double getOffsetWithCount(){
//   return _offsets.last;
//  }
//
//  // void changeOffset
//
// List<int> _listStack =[0];

  int _animationDuration = 1;

  int getAnimationDuration() => _animationDuration;

  List<Widget> _widgetList = [
    SearchWidget(),
    // Container(height: 100,color: Colors.blueAccent,)
  ];
  void addWidgetList(Widget element) {
    _widgetList.add(element);
    // _widgetList.add(widget);
    // notifyListeners();
  }

  void animatePage() {
    // print(_widgetList);
    // print(_widgetList.length);
    _pageController.animateToPage(_widgetList.length - 1,
        duration: Duration(seconds: _animationDuration),
        curve: Curves.fastOutSlowIn);
    // _pageController.jumpToPage(1);
    notifyListeners();
  }

  void animatePageFaster(){
    _pageController.animateToPage(_widgetList.length-1, duration: Duration(milliseconds: 10), curve: Curves.fastLinearToSlowEaseIn);
    notifyListeners();
  }

  void animatePageRemoved() {
    _pageController.animateToPage(_widgetList.length - 2,
        duration: Duration(seconds: _animationDuration), curve: Curves.linearToEaseOut);
  }

  List<ScrollController> _listScrolls =[ScrollController()];
  List<double> _offsets =[0];



  Widget getLastWidget() {

    return _widgetList.last;
  }
  // int getListStackLastElement() => _listStack.last;
  //
  // List<int> getListStack()=> _listStack;

  List<Widget> getWidgetList() => _widgetList;

  List<AnimationController> _listAnimationController = [];

  void jumpToLastPage(){
    print('motherfucker');

    _pageController.jumpToPage(_widgetList.length-1);
    notifyListeners();
  }

  void removeWidgetList() async {
   print(_widgetList.length);
   if(_widgetList.length>1) {
    await Future.delayed(Duration(seconds: _animationDuration));
    if(_widgetList.length>1) {
     _widgetList.removeLast();
     print(_widgetList);
     notifyListeners();
    }

   }
  }
  //
  // void removeListStackLastElement(){
  //  _listStack.removeLast();
  //  notifyListeners();
  // }
  //
  //
  // void addIndexListStack(int index) {
  //  _listStack.add(index);
  //  notifyListeners();
  // }
  //
  // int getNavigationIndex() => _listStack.length;
  //
  // bool getHideStatus() => _hide;
  //
  // void changeHideStatusToTrue(){
  //  _hide= true;
  //  notifyListeners();
  // }
  //
  // void changeHideStatusToFalse(){
  //  _hide= false;
  //  notifyListeners();
  // }

}
