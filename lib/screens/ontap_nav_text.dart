
import 'package:netflix_clone/the_provider/backend.dart';
import 'package:netflix_clone/widgets/appbars/custom_app_bar.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:netflix_clone/the_provider/mylist_provider.dart';

const kTextStyle = TextStyle(
  color: Colors.white54,
  fontSize: 16,
);

const kActiveTextStyle = TextStyle(fontSize: 22, color: Colors.white);

class OnTapNavText extends StatelessWidget {
  final bool onTapTvShowValue;
  final bool onTapMovieValue;
  final bool onTapMyListValue;
  const OnTapNavText({
    Key? key,
    required this.onTapTvShowValue,
    required this.onTapMovieValue,
    required this.onTapMyListValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('hello');
    final _provider = Provider.of<Backend>(context);
    final _provider2 = Provider.of<MyListProvider>(context);
    print(_provider2.onTapMyListValue());
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            splashColor: Colors.grey[100],
            onPressed: () {
              // print(_provider.myListGenreVisibility());
              // print(_provider2.onTapMyListValue());
              Navigator.pop(context);

            },
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.black12.withOpacity(0.5.clamp(0, 1).toDouble()),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TheText(text: 'All', textStyle: kTextStyle, onTap: () {
                if(onTapTvShowValue){
                  _provider.changeAlignment(Alignment.center);
                  _provider.changeOnTapGeneralValue();
                  _provider.changeTvShowsGenreVisibilityValue();
                  _provider.changeFakeExpandedBoxesValue();
                  // _provider.changeOnTapTvValueToFalse();
                  Navigator.pop(context);
                }
                if(onTapMovieValue){
                  _provider.changeOnTapGeneralValue();
                  _provider.changeMovieFakeExpanded();
                  _provider.changeAlignment(Alignment.center);
                  _provider.changeMovieGenreVisibilityValue();
                  Navigator.pop(context);

                }
                if(onTapMyListValue){
                  Provider.of<MyListProvider>(context,listen: false).changeOnTapIconValue();
                  CustomAppBar.changeMyListToNormal(_provider);
                  // _provider.changeMyListGenreVisibility();
                  // _provider.changeAlignment(Alignment.centerRight);
                  // _provider.changeOnTapGeneralValue();
                  Navigator.pop(context);



                }
              }),
              SizedBox(
                height: 20,
              ),
              TheText(
                  text: 'TV Shows',
                  textStyle: onTapTvShowValue ? kActiveTextStyle : kTextStyle,
                  onTap: () {
                    if(onTapTvShowValue){
                      Navigator.pop(context);
                    }
                    else {
                      if(onTapMovieValue){

                        _provider.changeOnTapGeneralValue();
                        _provider.changeMovieFakeExpanded();
                        _provider.changeMovieGenreVisibilityValue();
                        _provider.changeOnTapMovieValueToFalse();

                      }
                      if(onTapMyListValue){
                        _provider.changeMyListGenreVisibility();
                        _provider.changeOnTapGeneralValue();
                        _provider2.changeOnTapMyListValueToFalse();
                      }


                      _provider.changeOnTapTvValueToTrue();
                      _provider.changeOnTapGeneralValue();
                      _provider.changeTvShowsGenreVisibilityValue();
                      _provider.changeFakeExpandedBoxesValue();

                      Navigator.pop(context);

                    }
                  }),
              SizedBox(
                height: 20,
              ),
              TheText(
                  text: 'Movies',
                  textStyle: onTapMovieValue ? kActiveTextStyle : kTextStyle,
                  onTap: () {
                    if(onTapMovieValue){
                      Navigator.pop(context);
                    }
                    else{
                      if(onTapTvShowValue){

                        _provider.changeOnTapGeneralValue();
                        _provider.changeTvShowsGenreVisibilityValue();
                        _provider.changeFakeExpandedBoxesValue();
                        _provider.changeOnTapTvValueToFalse();
                      }
                      if(onTapMyListValue){
                        _provider.changeMyListGenreVisibility();
                        _provider.changeOnTapGeneralValue();
                        _provider2.changeOnTapMyListValueToFalse();
                      }
                      _provider.changeOnTapMovieValueToTrue();

                      _provider.changeOnTapGeneralValue();
                      _provider.changeMovieFakeExpanded();
                      _provider.changeMovieGenreVisibilityValue();

                      Navigator.pop(context);
                      // data.changeMovieFakeExpanded();
                      // data.changeMovieGenreVisibilityValue();
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              TheText(
                  text: 'MyList',
                  textStyle: onTapMyListValue ? kActiveTextStyle : kTextStyle,
                  onTap: () {
                    print(_provider2.onTapMyListValue())
;                    if(onTapMyListValue){
                      Navigator.pop(context);
                    }
                    else{
                      if(onTapTvShowValue){
                        _provider.changeOnTapGeneralValue();
                        _provider.changeTvShowsGenreVisibilityValue();
                        _provider.changeFakeExpandedBoxesValue();
                        _provider.changeOnTapTvValueToFalse();
                      }
                      if(onTapMovieValue){
                        _provider.changeOnTapGeneralValue();
                        _provider.changeMovieFakeExpanded();
                        _provider.changeMovieGenreVisibilityValue();
                        _provider.changeOnTapMovieValueToFalse();
                      }
                      _provider2.changeOnTapMyListValueToTrue();
                      _provider.changeOnTapGeneralValue();
                      _provider.changeMyListGenreVisibility();

                      Navigator.pop(context);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TheText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Function() onTap;

  const TheText(
      {Key? key,
      required this.text,
      required this.textStyle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
