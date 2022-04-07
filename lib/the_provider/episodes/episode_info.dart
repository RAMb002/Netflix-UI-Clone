import 'package:flutter/cupertino.dart';

class EpisodeInfo extends ChangeNotifier{

  bool _episodeInfoData = false;
  int _index = 0 ;
  int _luckyNumber =0;

  int getLuckyNumber(){
    return _luckyNumber;
  }

  void changeLuckyNumber(int luckyNumber){
    _luckyNumber = luckyNumber;
    notifyListeners();
  }

  bool episodeInfoData(){
    return _episodeInfoData;
  }

  void changeEpisodeInfoDataToTrue(){
    _episodeInfoData = true;
    notifyListeners();
  }

  void changeEpisodeInfoDataToFalse(){
    _episodeInfoData = false;
    notifyListeners();
  }


  int episodeIndexValue(){
    return _index;
  }

  void changeEpisodeIndexValue(int index){
    _index = index;
    notifyListeners();
  }


}