import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/data/content_model.dart';
import 'package:netflix_clone/the_provider/comingsoon_screen/my_list.dart';
import 'package:netflix_clone/the_provider/nested_scroll_controller.dart';
// import 'package:netflix_clone/screens/main_screens/downloads_screen.dart';
// import 'package:netflix_clone/screens/main_screens/more_screen.dart';
// import 'package:netflix_clone/screens/main_screens/search_screen.dart';
// import 'package:netflix_clone/widgets/bottom_navigation_container.dart';
// import 'package:netflix_clone/the_provider/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';

class ComingSoonScreen extends StatefulWidget {
  static const valueKey = ValueKey('ComingSoonScreen');

  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  final ScrollController _scrollController = ScrollController();
  // final ScrollController _nestedScrollController = ScrollController();
  // double scrollValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      var maxScrollView = _scrollController.position.maxScrollExtent;
      var divisor = (maxScrollView / originalsTwo.length) + 70;
      var scrollValue = _scrollController.offset.round();

      Provider.of<MyList>(context, listen: false)
          .changeSlideValue((scrollValue / divisor).round());
      // print(slideValue);
      // print(scrollValue);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('comingsoon build');
    double _containerHeight = 250;
    // bool shit = true
    return ListView.builder(
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      controller: _scrollController,
      itemCount: originalsTwo.length,
      itemBuilder: (BuildContext context, index) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: index == 0,
                  child: Container(
                      height: 51,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Text(
                              'Notifications',
                              style: TextStyle(
                                fontSize:15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.3),
                            )
                          ],
                        ),
                      )),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      // color: list[index],
                      height: _containerHeight,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(originalsTwo[index].imageUrl),
                              fit: BoxFit.cover)),
                    ),
                    index==3 || index==8?
                    Positioned(
                      bottom: -10,
                      left: 10,
                      right: 60,
                      child: Container(
                        height: 90,
                        // width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(originalsTwo[index].logo),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ):Container(),
                    index==2 || index==7?
                    Positioned(
                      bottom: 10,
                      // left: -20,
                      right: -10,
                      child: Image(
                        height: 80,
                        width: 150,
                        color: index == 2 || index == 7
                            ? Colors.yellow
                            : null,
                        image: AssetImage(
                          originalsTwo[index].logo,
                        ),
                      ),
                    ):Container(),
                    index==4 || index==9?
                    Positioned(
                      bottom: 05,
                      // left: -20,
                      right: 2,
                      child: Image(
                        height: 100,
                        width: 200,
                        color: index == 2 || index == 7
                            ? Colors.yellow
                            : null,
                        image: AssetImage(
                          originalsTwo[index].logo,
                        ),
                      ),
                    ):Container(),
                    index==1 || index==6 ?
                        Positioned(
                          bottom: 10,
                            left: 10,
                            child: Text(
                          'The Witcher',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),):Container(),
                    Positioned(
                      left: 00,
                      top: 12,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.netflixLogo0),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: _containerHeight,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0,0.03],
                            colors: [Colors.black,Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: _containerHeight,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              stops: [0,0.03],
                              colors: [Colors.black,Colors.transparent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent.withOpacity(0.7),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 265,
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          bottom: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            index == 1 || index == 6
                                ? Container(
                                    height: 80,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.pink, BlendMode.color),
                                      image: AssetImage(
                                        originalsTwo[index].logo,
                                      ),
                                      fit: BoxFit.contain,
                                    )),
                                  )
                                : Material(
                              color: Colors.transparent,
                                  child: InkWell(
                                    // splashColor: Colors.red,
                                    onTap: (){print('hi');},
                                    child: Image(
                                        height: 80,
                                        width: 150,
                                        color: index == 2 || index == 7
                                            ? Colors.white
                                            : null,
                                        image: AssetImage(
                                          originalsTwo[index].logo,
                                        ),
                                      ),
                                  ),
                                ),
                            Consumer<MyList>(
                              builder: (context, data, child) {
                                return Container(
                                  // color: Colors.red,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlatButton(
                                        height: 80,
                                        splashColor: Colors.grey.shade800,
                                        onPressed: () {
                                          if (!originalsTwo[index].tickValue) {
                                            originalsTwo[index].tickValue =
                                                true;
                                            print(
                                                originalsTwo[index].tickValue);
                                            data.changeTickValueToFalse();
                                          } else {
                                            originalsTwo[index].tickValue =
                                                false;
                                            data.changeTickValueToFalse();
                                          }

                                          // if(data.getIndex()!=index){
                                          //   data.changeTickValueToFalse();
                                          // }
                                          // if(data.getTickValue()){
                                          //   data.changeTickValueToFalse();
                                          //   // data.changeTickValueToTrue();
                                          //   // data.changeIndex(index);
                                          // }
                                          // else{
                                          //   data.changeIndex(index);
                                          //   data.changeTickValueToTrue();
                                          // }
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              originalsTwo[index].tickValue
                                                  ? Icon(
                                                      Icons.check,
                                                      color: Colors.blue,
                                                    )
                                                  : Icon(
                                                      Icons.notifications,
                                                      color: Colors.white,
                                                    ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Remind Me',
                                                style: TextStyle(
                                                    color: originalsTwo[index]
                                                            .tickValue
                                                        ? Colors.blue
                                                        : Colors.white38),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      FlatButton(
                                        height: 80,
                                        splashColor: Colors.grey.shade800,
                                        onPressed: () {},
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.share,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Share',
                                              style: TextStyle(
                                                  color: Colors.white38),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            // SizedBox(width: 10,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Season 3 Coming Wednesday',
                        style: TextStyle(color: Colors.white38),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        originalsTwo[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          originalsTwo[index].description,
                          style: TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FittedBox(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Suspenseful  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              TextSpan(
                                  text: '•',
                                  style: TextStyle(
                                    color: originalsTwo[index].color,
                                  )),
                              TextSpan(
                                  text: '  Action & Adventure  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              TextSpan(
                                  text: '•',
                                  style: TextStyle(
                                    color: originalsTwo[index].color,
                                  )),
                              TextSpan(
                                  text: '  Drama  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              TextSpan(
                                  text: '•',
                                  style: TextStyle(
                                    color: originalsTwo[index].color,
                                  )),
                              TextSpan(
                                  text: '  Ensemble  ',
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(
                                  text: '•',
                                  style: TextStyle(
                                    color: originalsTwo[index].color,
                                  )),
                              TextSpan(
                                  text: '  Combat  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ]),
                          ),
                        ),
                      ),
                      // Center(
                      //   child: Text(
                      //       ' Suspenseful  • Action & Adventure  • Drama  • Ensemble  • Combat',
                      //     style: TextStyle(color: Colors.white,fontSize: 12),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),

                // Container(
                //   height: 100,
                //   child: Row(
                //     children: [
                //       Text(
                //         originalsTwo[index].name,
                //         style: TextStyle(
                //           color: Colors.white
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
            Positioned(
              // top: 50,
              child: Consumer<MyList>(
                builder: (context, data, child) {
                  return Visibility(
                    visible: data.getSlideValue() != index,
                    child: IgnorePointer(
                      child: Container(
                        color: Colors.transparent.withOpacity(0.8),
                        height: _containerHeight + 295,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
