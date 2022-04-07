import 'package:flutter/cupertino.dart';

class GenreSelection extends ChangeNotifier{
  String _currentGenre ='All Genres';

  String getCurrentGenre(){
    return _currentGenre;
  }

  void changeCurrentGenre(String string){
    _currentGenre =string;
    notifyListeners();

  }
}