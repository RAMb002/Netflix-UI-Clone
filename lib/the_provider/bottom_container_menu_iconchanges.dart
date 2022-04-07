import 'package:flutter/cupertino.dart';

class BottomContainerMenuIconChanges extends ChangeNotifier{
  bool _dislikeIcon = true, _likeIcon=true;

  bool getDislikeIcon(){
    return _dislikeIcon;
  }
  void changeDislikeIcon(){
    _dislikeIcon = ! _dislikeIcon;
    notifyListeners();
  }
  bool getLikeIcon(){
    return _likeIcon;
  }

  void changeLikeIcon() {
    _likeIcon = !_likeIcon;
    notifyListeners();
  }
}