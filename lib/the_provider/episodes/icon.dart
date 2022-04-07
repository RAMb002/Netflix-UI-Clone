import 'package:flutter/cupertino.dart';

class IconChange extends ChangeNotifier{

  bool _myListIcon = false, _likeIcon=true, _onTouched = false;

  bool getOnTouched(){
    return _onTouched;
  }

  void changeOnTouchedToTrue(){
    _onTouched = true;
    notifyListeners();
  }
  void changeOnTouchedToFalse(){
    _onTouched = false;
    notifyListeners();
  }

  bool getMyListIcon(){
    return _myListIcon;
  }
  void changeMyListIcon(bool exists){
    _myListIcon = exists;
    notifyListeners();
  }
  bool getLikeIcon(){
    return _likeIcon;
  }

  void changeLikeIcon(){
    _likeIcon = !_likeIcon;
    notifyListeners();
  }
}