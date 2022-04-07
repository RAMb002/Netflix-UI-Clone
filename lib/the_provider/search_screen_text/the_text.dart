import 'package:flutter/cupertino.dart';

class TextFieldText extends ChangeNotifier{

  String _text ='';

  String getText(){
    return _text;
  }

  void changeText(String string){
    _text = string;
    notifyListeners();
  }
}