import 'package:flutter/cupertino.dart';

class AccountName extends ChangeNotifier{
  String _name1 = "Vijay" , _name2 = "Rahul" , _name3 = "Sakthi" , _name4 = "Ram";

  String getName1(){
    return _name1;
  }
  String getName2(){
    return _name2;
  }
  String getName3(){
    return _name3;
  }
  String getName4(){
    return _name4;
  }

  void changeName1 (String name){
    _name1 = name;
    notifyListeners();
  }
  void changeName2 (String name){
    _name2 = name;
    notifyListeners();
  }
  void changeName3 (String name){
    _name3 = name;
    notifyListeners();
  }
  void changeName4 (String name){
    _name4 = name;
    notifyListeners();
  }
}