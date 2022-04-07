import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Backend extends ChangeNotifier{

  bool _done = true;
  bool _onTapTvShows = false, _onTapMovies = false ;
  String _top = '';
  Alignment _alignment = Alignment.center;

  bool _tvShowsGenreVisibility = false , _movieGenreVisibility = false ,_myListGenreVisibility =false;
  bool _fakeExpandedBoxes = true;

  bool _onTapGeneralValue = false , _movieFakeExpanded = false;

  bool movieFakeExpanded(){
    return _movieFakeExpanded;
  }
  void changeMovieFakeExpanded(){
    _movieFakeExpanded =!_movieFakeExpanded;
    notifyListeners();
  }

  bool onTapGeneralValue(){
    return _onTapGeneralValue;
  }

  void changeOnTapGeneralValue(){
    _onTapGeneralValue = !_onTapGeneralValue;
    notifyListeners();
  }

  bool fakeExpandedBoxes(){
    return _fakeExpandedBoxes;
  }

  void changeFakeExpandedBoxesValue(){
    _fakeExpandedBoxes =!_fakeExpandedBoxes;
    notifyListeners();
  }

  bool tvShowsGenreVisibility(){
    return _tvShowsGenreVisibility;
  }

  void changeTvShowsGenreVisibilityValue(){
    _tvShowsGenreVisibility = !_tvShowsGenreVisibility;
    notifyListeners();
  }

  bool movieGenreVisibility(){
    return _movieGenreVisibility;
  }

  void changeMovieGenreVisibilityValue(){
    _movieGenreVisibility = !_movieGenreVisibility;
    notifyListeners();
  }

  bool myListGenreVisibility(){
    return _myListGenreVisibility;
  }
  void changeMyListGenreVisibility(){
    _myListGenreVisibility = ! _myListGenreVisibility;
    notifyListeners();
  }

  Alignment alignment(){
    return _alignment;
  }

  void changeAlignment(Alignment alignment){
    _alignment = alignment;
    notifyListeners();
  }

  void specialChangeAlignment(){
    _alignment = Alignment.centerRight;
    print('hi');
    notifyListeners();

  }


  String onTopString(){
    return _top;
  }


  bool onTapMovieValue(){
    return _onTapMovies;
  }

  void changeOnTapMovieValueToTrue(){
    _onTapMovies = true;
    notifyListeners();
  }

  void changeOnTapMovieValueToFalse(){
    _onTapMovies = false;
    notifyListeners();
  }

  void changeOnTop(String string){
    _top = string;
    notifyListeners();
  }

  bool onTapTvValue(){
    return _onTapTvShows;
  }

  void changeOnTapTvValueToTrue(){
    _onTapTvShows = true;
    notifyListeners();
  }

  void changeOnTapTvValueToFalse(){
    _onTapTvShows = false;
    notifyListeners();
  }




  bool doneValue(){
    return _done;
  }

  void changeDoneValue(bool appbar){
    _done = appbar;
    notifyListeners();
  }



  // bool expenseButton(){
  //   return _expenseButton;
  // }
  // bool incomeButton(){
  //   return _incomeButton;
  // }
  // bool detailsButton(){
  //   return _detailsButton;
  // }
  //
  // void changeExpenseButton(){
  //   _expenseButton = !_expenseButton;
  //   notifyListeners();
  // }
  // void changeIncomeButton(){
  //   _incomeButton = !_incomeButton;
  //   notifyListeners();
  // }
  // void changeDetailsButton(){
  //   _detailsButton = !_detailsButton;
  //   notifyListeners();
  // }
}