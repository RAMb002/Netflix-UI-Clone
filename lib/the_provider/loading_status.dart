import 'package:flutter/cupertino.dart';

class LoadingStatus extends ChangeNotifier{
  bool _loadingStatus = false;

  bool getLoadingStatus(){
    return _loadingStatus;
  }

  void changeLoadingStatus(bool status){
    _loadingStatus = status;
    notifyListeners();
  }
}