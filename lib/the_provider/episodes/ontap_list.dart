import 'package:flutter/cupertino.dart';

class OnTapListValues extends ChangeNotifier{

 ScrollController _scrollController = ScrollController();

 ScrollController getScrollController(){
   return _scrollController;
 }
 void changeScrollOffsetToZero(){
   _scrollController.jumpTo(0);
   notifyListeners();
 }

}