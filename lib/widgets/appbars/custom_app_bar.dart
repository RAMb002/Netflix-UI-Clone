import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/assets.dart';
import 'package:netflix_clone/screens/all_genres.dart';
import 'package:netflix_clone/the_provider/backend.dart';
import 'package:netflix_clone/the_provider/genre_selection.dart';
import 'package:netflix_clone/the_provider/nested_scroll_controller.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/the_provider/mylist_provider.dart';

class CustomAppBar extends StatelessWidget {
  // final double offset;
  // final bool showAppBar;
  final Function() onTap1;
  final Function() onTap2;
  final Function() onTap3;
  final String onTopString;
  final Alignment alignment;
  final bool onTapTvShowValue;
  final bool onTapMovieValue;
  final bool onTapMyListValue;
  final Function() onEnd1;
  final Function() onEnd2;
  final Function() onEnd3;
  const CustomAppBar(
      {Key? key,
      // this.offset = 0,
      // required this.showAppBar,
      required this.onTap1,
      required this.onTap2,
      required this.onTap3,
      this.onTopString = '',
      required this.alignment,
      required this.onTapTvShowValue,
      required this.onTapMovieValue,
      required this.onTapMyListValue,
      required this.onEnd1,
      required this.onEnd2,
      required this.onEnd3})
      : super(key: key);


  static void changeTvShowsToNormal(Backend data){
    data.changeAlignment(Alignment.center);
    data.changeOnTapGeneralValue();
    data.changeTvShowsGenreVisibilityValue();
    data.changeFakeExpandedBoxesValue();
  }

  static void changeMoviesToNormal(Backend data){
    data.changeOnTapGeneralValue();
    data.changeMovieFakeExpanded();
    data.changeAlignment(Alignment.center);
    data.changeMovieGenreVisibilityValue();
  }
  static void changeMyListToNormal(Backend data){
    data.changeMyListGenreVisibility();
    data.changeAlignment(Alignment.centerRight);
    data.changeOnTapGeneralValue();
    print(data.onTapGeneralValue());
  }
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    // print('appbar');
    // final provider=  Provider.of<Backend>(context,listen: false);
    return Container(
      // height: 60,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6),
        child: Consumer<Backend>(builder: (context, data, child) {
          return SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    Provider.of<NestedScrollController>(context,listen: false).changeScrollValueToZero();
                    if (onTapTvShowValue) {
                      changeTvShowsToNormal(data);
                      // print(data.tvShowsGenreVisibility());
                      // provider.changeTrialValue();
                    }
                    if (onTapMovieValue) {
                      changeMoviesToNormal(data);
                      // print(data.movieGenreVisibility());
                    }

                    if (onTapMyListValue) {
                      Provider.of<MyListProvider>(context,listen: false).changeOnTapIconValue();
                      changeMyListToNormal(data);
                    }
                  },
                  child: Image.asset(Assets.netflixLogo0),
                ),
                SizedBox(width: 20),
                // SizedBox(width: 40,),
                Visibility(
                  visible:
                      onTapMovieValue || onTapMyListValue ? false : true,
                  child: Expanded(
                    child: GestureDetector(
                      onTap: onTap1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            // flex: Provider.of<Backend>(context).trialValue() ? 1: 1,
                            child: AnimatedAlign(
                              onEnd: onEnd1,
                              alignment: alignment,
                              duration: Duration(milliseconds: 400),
                              child: BarButton(
                                text: 'TV Shows',
                              ),
                            ),
                          ),
                          data.tvShowsGenreVisibility()
                              ? DownIcon(
                                  // showAppBar: showAppBar,
                                  onTapMovieValue: onTapMovieValue,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                data.tvShowsGenreVisibility() == true
                    ? MyGenre()
                    : Container(),

                Visibility(
                  visible:
                      onTapTvShowValue || onTapMyListValue ? false : true,
                  child: Expanded(
                    child: GestureDetector(
                      onTap: onTap2,
                      child: Row(
                        children: [
                          Expanded(
                            child: AnimatedAlign(
                              onEnd: onEnd2,
                              alignment: alignment,
                              duration: Duration(milliseconds: 400),
                              child: BarButton(
                                text: 'Movies',
                              ),
                            ),
                          ),
                          data.movieGenreVisibility()
                              ? DownIcon(
                                  // showAppBar: showAppBar,
                                  onTapMovieValue: onTapMovieValue,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                data.movieGenreVisibility() == true
                    ? MyGenre()
                    : Container(),
                Visibility(
                  visible:
                      onTapTvShowValue || onTapMovieValue ? false : true,
                  child: Expanded(
                    child: GestureDetector(
                      onTap: onTap3,
                      child: Row(
                        // mainAxisAlignment: onTapMyListValue ? MainAxisAlignment.start : MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AnimatedAlign(
                              onEnd: onEnd3,
                              curve: Curves.easeIn,
                              alignment: alignment,
                              duration: Duration(milliseconds: 400),
                              child: BarButton(
                                text: 'My List',
                              ),
                            ),
                          ),
                          data.myListGenreVisibility()
                              ? Visibility(
                                  visible: Provider.of<MyListProvider>(context).onTapMyListValue(),
                            // visible: true,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: _screenWidth * 0.06),
                                    child: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                onTapTvShowValue ||
                        data.movieFakeExpanded() ||
                        data.myListGenreVisibility()
                    ? Expanded(child: Text(''))
                    : Container(),
                onTapTvShowValue && data.fakeExpandedBoxes() ||
                        data.myListGenreVisibility()
                    ? Expanded(child: Text(''))
                    : Container(),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class DownIcon extends StatelessWidget {
  const DownIcon({
    Key? key,
    // required this.showAppBar,
    required this.onTapMovieValue,
  }) : super(key: key);

  // final bool showAppBar;
  final bool onTapMovieValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: onTapMovieValue
          ? EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08)
          : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.035),
      child: Icon(
        Icons.arrow_drop_down_sharp,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

class MyGenre extends StatelessWidget {
  const MyGenre({
    Key? key,
    // required this.showAppBar,
  }) : super(key: key);

  // final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer<GenreSelection>(
            builder: (context,data,child){
              return Text(
                data.getCurrentGenre(),
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                ),
              );
            },


          ),
          Icon(
            Icons.arrow_drop_down_sharp,
            color: Colors.white60,
            size: 25,
          ),
        ],
      ),
      onTap: (){
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return AllGenres();
            },
          ),
        );
      },
    );
  }
}

class BarButton extends StatelessWidget {
  final String text;

  const BarButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
