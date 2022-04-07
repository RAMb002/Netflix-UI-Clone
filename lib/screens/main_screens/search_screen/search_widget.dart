import 'package:flutter/material.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/screens/episode_beta.dart';
import 'package:netflix_clone/the_provider/search_screen_text/list_stacks.dart';
import 'package:netflix_clone/the_provider/search_screen_text/scroll.dart';
import 'package:netflix_clone/the_provider/search_screen_text/search_finish.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/the_provider/search_screen_text/foucs.dart';
import 'package:netflix_clone/data/content_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}
String text = '';
TextEditingController _controller = TextEditingController();

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {

    final _provider =Provider.of<ListStacks>(context,listen: false);
    // final _provider =Provider.of<ListStacks>(context,listen: false);
    FocusNode _focus = new FocusNode();

// late AnimationController _animationController;
    int count = 0;


    int usingIndex = 0;
    List<Content> usingList = [];

    final double _screenWidth = MediaQuery.of(context).size.width;
    return   Column(
      children: [
        Container(
            color: Colors.black,
            height: 70,
            child: Consumer<TextFocus>(builder: (context, data, child) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                var shit =
                    WidgetsBinding.instance?.window.viewInsets.bottom;
                if (shit != null) {
                  if (shit > 0) {
                    // print('hi');
                    data.changeFocusValueToTrue();
                  }
                }
                if (shit != null) {
                  if (shit == 0) {
                    data.changeFocusValueToFalse();
                  }
                }
              });
              return AnimatedPadding(
                padding: data.focusValue()
                    ? EdgeInsets.all(0)
                    : EdgeInsets.all(8),
                duration: Duration(milliseconds: 100),
                child: TextField(
                  onChanged: (value) {
                    // print(_controller.text);
                    // print(value);
                    // print(text);
                    setState(() {
                      text =  value;
                      print(text);
                    });
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _controller,
                  // autofocus: true,
                  cursorColor: Colors.white,
                  cursorHeight: 22,
                  showCursor: data.focusValue(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white70,
                    ),
                    suffixIcon: text.isEmpty
                        ? Icon(
                      Icons.mic,
                      color: Colors.white70,
                    )
                        : IconButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        setState(() {
                          text = '';
                          _controller.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white70,
                      ),
                    ),
                    hintText: 'Search for a show,movie,genre,etc.',
                    hintStyle:
                    TextStyle(color: Colors.white30, fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade800, width: 1)),

                    fillColor: Colors.grey[850],
                    filled: true,
                    // isDense: true
                  ),
                ),
              );
            })),
        SizedBox(
          height: 8,
        ),
        text.isEmpty
            ? Expanded(
            child: ListView.builder(
                itemCount: originals.length,
                itemBuilder: (BuildContext context, index) {
                  return Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          index == 0
                              ? Container(
                            child: Text(
                              '  Top Searches',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23),
                            ),
                          )
                              : Container(),
                          index == 0
                              ? SizedBox(
                            height: 10,
                          )
                              : Container(),
                          FlatButton(
                            onPressed: () {

                              int epIndex =0;
                              if(originals[index].text=='movie'){
                                epIndex=2;
                              }
                              Provider.of<SearchFinish>(context,listen: false).changeFinish(true);

                              _provider.addWidgetList(
                                   EpisodeBeta(
                                     epiIndex:epIndex ,
                                     index: index,
                                     list: originals,
                                   ),
                                );
                              _provider.animatePage();
                              if(_provider.getWidgetList().length>1) {
                                PageController _pageController = PageController(
                                    initialPage: _provider
                                        .getWidgetList()
                                        .length - 1,keepPage: true);
                                _provider.changePageController(_pageController);
                                Provider.of<Scroll>(context, listen: false)
                                    .changeOffsetValueToZero();
                              }


                            },
                            padding: EdgeInsets.all(0),
                            color: Color(0xFF141518),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 85,
                                  width: _screenWidth * 0.35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              originals[index]
                                                  .imageUrl),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 85,
                                  width: _screenWidth * 0.47,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 0, 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${originals[index].name}',
                                        style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: _screenWidth * 0.18,
                                  height: 85,
                                  // color: Colors.red,
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          )
                        ],
                      ),
                    ],
                  );
                  //
                  // list.add(tile);
                  // list.add(SizedBox(
                  //   height: 1,
                  // ));
                })

          // ListView(children: widgets(originalsTwo,_screenWidth)),
        )
            : Padding(
          padding: EdgeInsets.all(22),
          child: Container(
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Oh darn. We don't have that.",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Try searching for another movie, show, actor, director, or genre.',
                  style: TextStyle(color: Colors.white38),
                )
              ],
            ),
          ),
        )
      ],
    );

  }
}



