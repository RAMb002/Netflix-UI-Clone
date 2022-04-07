import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/screens/season_screen.dart';
import 'package:netflix_clone/the_provider/episodes/episode_app_bar_data.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/the_provider/episodes/icon.dart';
import 'package:netflix_clone/the_provider/episodes/navigation.dart';
import 'package:netflix_clone/the_provider/episodes/ontap_list.dart';
import 'package:netflix_clone/the_provider/episodes/slide_animation.dart';
import 'package:netflix_clone/the_provider/morescreen_list.dart';
import 'package:netflix_clone/the_provider/search_screen_text/epi_index.dart';
import 'package:netflix_clone/the_provider/search_screen_text/epi_like.dart';
import 'package:netflix_clone/the_provider/search_screen_text/epi_list.dart';
import 'package:netflix_clone/the_provider/search_screen_text/list_stacks.dart';
import 'package:netflix_clone/the_provider/search_screen_text/scroll.dart';
import 'package:netflix_clone/the_provider/search_screen_text/search_finish.dart';
import 'package:netflix_clone/widgets/bottom_container.dart';
import 'package:netflix_clone/widgets/play_button_stack.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/widgets/my_list.dart';
import 'package:netflix_clone/data/content_model.dart';

const kTextStyle = TextStyle(
  color: Colors.white60,
);

class EpisodeBeta extends StatefulWidget {
  // static late AnimationController animationController;
  const EpisodeBeta({Key? key, required this.list, required this.index,required this.epiIndex})
      : super(key: key);

  final List<Content> list;
  final int index;
  final int epiIndex;

  // final ScrollController scrollController;

  @override
  State<EpisodeBeta> createState() => _EpisodeBetaState();
}

class _EpisodeBetaState extends State<EpisodeBeta>
    with TickerProviderStateMixin {
  static late AnimationController animationController;
  // late TabController _tabController;
  late Animation<Offset> _animation;
  // GlobalKey<FormState> _abcKey = GlobalKey<FormState>();
  // static double number = 0;
  @override
  void initState() {
    // print('initstate');
    // TODO: implement initState
    // _tabController = TabController(length: 2, vsync: this);
    // animationController = AnimationController(
    //   duration: const Duration(milliseconds: 200),
    //   vsync: this,
    // );
    // animationController.forward();
    // // print('forwarded');
    // // ..repeat(reverse: true);
    // _animation = Tween<Offset>(
    //   begin: Offset(1, 0),
    //   end: Offset.zero,
    // ).animate(CurvedAnimation(
    //   parent: animationController,
    //   curve: Curves.linear,
    // ));

    // animationController.addStatusListener((status) {print(status);});
    super.initState();
  }

  // @override
  // void dispose() {
  //   // animationController.reverse();
  //
  //   // TODO: implement dispose
  //   super.dispose();
  //   animationController.dispose();
  // }
  static List<Widget> myListContainers(
      List<Content> list, double screenWidth, BuildContext context) {
    final _provider = Provider.of<ListStacks>(context, listen: false);
    final _offsetProvider = Provider.of<Scroll>(context,listen: false);

    List<Widget> theList = [];
    for (int i = 0; i < list.length; i++) {
      final container = Stack(
        children: [
          Container(
            padding: EdgeInsets.only(right: 7),
            height: MediaQuery.of(context).size.width * 0.415,
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(list[i].imageUrl),
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(child: Container(
            height: MediaQuery.of(context).size.width * 0.415,
            width: screenWidth * 0.3,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                onTap: () {
                  // String ram='ram';
                  // AnimationController ram =AnimationController(vsync: vsync);
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                    backgroundColor: Color(0xFF141518),
                    context: context,
                    builder: (context) {
                      return BottomContainer(
                        list: list,
                        index: i,
                        onTap: () {
                          Navigator.pop(context);

                          _offsetProvider.changeOffsetValueToZero();
                          Provider.of<SearchFinish>(context,listen: false).changeFinish(true);
                          _provider.addWidgetList(
                            EpisodeBeta(
                              epiIndex:trending[i].text=='movie' ? 2 : 0 ,
                              index: i,
                              list: trending,
                            ),

                            // Positioned(
                            //   key: _provider.getKey(),
                            //   child:
                            //       Consumer<ListStacks>(builder: (context, data, child) {
                            //         bool shit = false;
                            //         for(int i=0;i<data.getKeyList().length;i++) {
                            //           if (data.getLastWidget().key==data.getKeyList()[i]){
                            //             if(data.getCount()==i || data.getCount()==i-1){
                            //               // print(i);
                            //               // print('${data.getCount()}  *********************');
                            //               // print('true');
                            //               shit = true;
                            //               break;
                            //             }
                            //
                            //
                            //           } else{
                            //             // print('$i false');
                            //           }
                            //         }
                            //         // if(data.getCloneCount()>data.getCount()){
                            //         //   shit = true;
                            //         //   print('motherfucker');
                            //         // }
                            //     // print(data.getOffsetWithCount());
                            //     return AnimatedSlide(
                            //       offset: shit ?Offset(data.getOffsetWithCount(), 0): Offset(0, 0),
                            //       duration:shit ? Duration(milliseconds: 300) : Duration(seconds: 2),
                            //       onEnd: () {
                            //         if (_provider.getHideStatus()) {
                            //           if(shit) {
                            //             // _provider.decrementCount();
                            //             // print('decremented');
                            //
                            //           }
                            //           _provider.removeListStackLastElement();
                            //           _provider.removeElementInOffsetList();
                            //           _provider.removeWidgetList();
                            //         }
                            //       },
                            //       child: Visibility(
                            //         visible: data.getListStack().isNotEmpty,
                            //         child: Container(
                            //             // color: Colors.black,
                            //             child: EpisodeBeta(
                            //           index: _provider.getListStackLastElement(),
                            //           list: trending,
                            //         )),
                            //       ),
                            //     );
                            //   }),
                            // ),
                          );
                          _provider.animatePage();
                          PageController _pageController = PageController(initialPage:_provider.getWidgetList().length-1);
                          _provider.changePageController(_pageController);
                            Provider.of<Scroll>(context, listen: false).changeOffsetValueToZero();

                        },
                      );
                    },
                  );
                },

              ),
            ),
          ))
        ],
      );
      theList.add(container);
    }
    return theList;
  }
  // double offset=0;
  @override
  Widget build(BuildContext context) {
    print('episodebeta build');
    // WidgetsBinding.instance?.addPostFrameCallback((_) async {
    //   final _provider = Provider.of<ListStacks>(context, listen: false);
    //   if (_provider.getOffsetWithCount() == 1 && !_provider.getHideStatus()) {
    //     _provider.changeOffsetToZero();
    //     // print(_provider.getOffsetWithCount());
    //   }
    // });

    //
    // late AnimationController animationController;
    //
    // late Animation<Offset> _animation;
    // // if (_provider.getMoreOnTapList()) {
    //   animationController = AnimationController(
    //     duration: const Duration(milliseconds: 2000),
    //     vsync: this,
    //   );
    //   animationController.forward();
    //   animationController.addStatusListener((status) {print(status);});
    //
    //   _animation = Tween<Offset>(
    //     begin: Offset(1, 0),
    //     end: Offset.zero,
    //   ).animate(CurvedAnimation(
    //     parent: animationController,
    //     curve: Curves.linear,
    //   ));
    // }

    final double _screenWidth = MediaQuery.of(context).size.width;
    final epiProvider = Provider.of<EpiIndex>(context,listen: false);
    WidgetsBinding.instance?.addPostFrameCallback((_){
      epiProvider.changeEpiIndex(widget.epiIndex);
    });

    List<Content> theList = widget.list;
    int index = widget.index;

    for(int i =0;i<myList2.length ; i++){
      if(theList[index].name == myList2[i].name){
        theList[index].myListCheck = true;
        break;
      }
    }

    print(theList[index].myListCheck);
    List list = [
      Container(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                width: double.infinity - 24,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage(theList[index].imageUrl),
                        fit: BoxFit.cover)),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2),
            child: Text(
              'Season 1 Trailer 1: ${theList[index].name}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 130,
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.only(top: 7, left: 10),
        child: Column(
          children: [
            Wrap(
                spacing: 9,
                runSpacing: 9,
                direction: Axis.horizontal,
                children: myListContainers(trending, _screenWidth, context)),
            SizedBox(
              height: 70,
            )
          ],
        ),
      )
    ];
    ScrollController _scrollController = ScrollController();

    final scrollProvider = Provider.of<Scroll>(context,listen: false);
    _scrollController = _scrollController..addListener(() {

        scrollProvider.changeOffSetValue(_scrollController);


      });

    print('episode build');
    // print(widget.index);
    // print(MediaQuery.of(context).size.width);
    // final _screenWidth = MediaQuery.of(context).size.width;
    // double a = 1;
    // double b = 0;
    return Consumer<SlideAnimation>(
      builder: (context, slide, child) {
        WidgetsBinding.instance?.addPostFrameCallback((_) async {
          // print('animation trigger');
          if (slide.getslideTransitionAnimationEnd() == 1) {
            // print(animationController.status);
            if (animationController.status == AnimationStatus.completed) {
              await animationController.reverse();
            }
            final iconProvider =
                Provider.of<IconChange>(context, listen: false);
            if (!iconProvider.getLikeIcon()) {
              iconProvider.changeLikeIcon();
            }
            if (Provider.of<MoreScreenList>(context, listen: false)
                .getMoreOnTapList()) {
              Provider.of<EpisodeInfo>(context, listen: false)
                  .changeEpisodeIndexValue(2);
            }

            slide.changeSlideTransitionAnimationEnd(0);
            Provider.of<EpisodeInfo>(context, listen: false)
                .changeEpisodeInfoDataToFalse();
          }
        });
        return Stack(
          children: [
            Container(
              color: Colors.black,
              child: CustomScrollView(
                shrinkWrap: true,
                // key: _abcKey,
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          height: 530,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(theList[index].imageUrl),
                            fit: BoxFit.cover,
                          )),
                          child: ClipRect(
                            child: BackdropFilter(
                              // blendMode: BlendMode.lighten,
                              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                // height: 50,
                                // width: 50,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 530,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                stops: [0.1, 1],
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomRight,
                                end: Alignment.topCenter),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          child: Container(
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 20,
                                  )
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                image: DecorationImage(
                                  image: AssetImage(theList[index].imageUrl),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        Positioned(
                          top: 270,
                          child: Row(
                            children: [
                              Text('2018', style: kTextStyle),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                padding: EdgeInsets.all(3),
                                child: Text(
                                  '16+',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                color: Colors.grey[600],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '1h 52m',
                                style: kTextStyle,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 300,
                          child: PlayButton(
                            buttonColor: Colors.white,
                            iconColor: Colors.black,
                            text: 'Play',
                            textColor: Colors.black,
                            iconSymbol: Icons.play_arrow,
                            onPressed: () {
                              // animationController.reverse();
                            },
                            iconSize: 35,
                          ),
                        ),
                        Positioned(
                          top: 343,
                          child: PlayButton(
                            buttonColor: Colors.grey.withOpacity(0.2),
                            iconColor: Colors.white,
                            text: 'Download',
                            textColor: Colors.white,
                            iconSymbol: Icons.file_download,
                            onPressed: () {},
                            iconSize: 32,
                          ),
                        ),
                        Positioned(
                          top: 400,
                          child: Container(
                              width: _screenWidth - 20,
                              child: Text(
                                theList[index].description,
                                style: TextStyle(
                                    color: Colors.white70, wordSpacing: 0.3),
                              )),
                        ),
                        Positioned(
                          bottom: -1,
                          left: 40,
                          child: Consumer<EpiList>(
                            builder: (context, iconData, child) {
                              bool shit = false;
                              for(int i=0;i<myList2.length;i++){
                                if(myList2[i].name == theList[index].name){
                                  print('trueee;;;;');
                                  shit = true;
                                  break;
                                }
                              }
                              if(shit == false){
                                print('false;;;;');
                                theList[index].myListCheck = false;
                              }
                              // bool exists = myList2.any((file) =>
                              // file.name !=theList[index].name);
                              //
                              // if(exists){
                              //   print('motherrsfsfs');
                              //   theList[index].myListCheck = false;
                              // }
                              // // iconProvider.changeMyListIcon(exists);
                              // bool shit= iconData.getBaka();
                              print('button');
                              return Row(
                                children: [
                                  IconString(
                                    onPressed: () {
                                      bool check = false;
                                      // theList[index].myListCheck = true;
                                      // iconData.changeBaka();
                                      for(int i=0;i<myList2.length;i++){
                                        if(myList2[i].name == theList[index].name){
                                          check = true;
                                          myList2[i].myListCheck=false;
                                          myList2.removeAt(i);
                                          iconData.changeBaka();
                                          break;
                                        }
                                      }
                                      if(check==false){
                                        print('added');
                                        theList[index].myListCheck = true;
                                        myList2.add(theList[index]);
                                        iconData.changeBaka();

                                      }

                                    },
                                    iconSymbol: theList[index].myListCheck
                                        ? Icons.check
                                        : Icons.add,
                                    text: 'My List',
                                  ),
                                  SizedBox(
                                    width: _screenWidth * 0.15,
                                  ),
                                  Consumer<EpiLike>(
                                    builder:(context,data,child) =>
                                     IconString(
                                      onPressed: () {
                                        if(theList[index].like){
                                          // print('its already true');
                                          theList[index].like = false;
                                          data.changeLike(false);
                                        }
                                        else if(!theList[index].like) {
                                          // print('its already false');
                                          theList[index].like = true;
                                          data.changeLike(false);
                                        }
                                        // iconData.changeLikeIcon();
                                      },
                                      iconSymbol: !theList[index].like
                                          ? Icons.thumb_up_alt_outlined
                                          : Icons.thumb_up_alt,
                                      text: 'Rate',
                                    ),
                                  ),
                                  SizedBox(
                                    width: _screenWidth * 0.15,
                                  ),
                                  IconString(
                                    onPressed: () {},
                                    iconSymbol: Icons.share,
                                    text: 'Share',
                                  ),
                                  // SizedBox(width: _screenWidth * 0.1,)
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Consumer<EpisodeNavigation>(
                      builder: (context, data3, child) {
                        // if(data.getList()[data.getListIndex()].text =='movie'){
                        //   data3.changeNavigationIndex(2);
                        //
                        // }
                        //
                        // print('second consumer');
                        double animatedContainerHeight = 15;
                        double stackBottom = -10;
                        return EpiMiniBody( stackBottom: stackBottom, theList: theList, index: index, animatedContainerHeight: animatedContainerHeight,theWidth: _screenWidth,list: theList,widgetList: list,episodeIndex: index,epiIndex: widget.epiIndex,);
                      },
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Consumer<EpisodeNavigation>(
                  //     builder: (context, data2, child) {
                  //       // print('3rd consumer');
                  //
                  //       return Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
            Positioned(
              child: Consumer<Scroll>(
                builder: (context,data,child) =>
                 Container(
                  height: 50,
                  color: Colors.black.withOpacity(
                  (data.offsetValue() / 300).clamp(0, 1).toDouble()),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Center(
                      child: Consumer<EpiIndex>(
                        builder: (context,data2,child) =>
                         Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {

                                // theList[index].
                                final _providerSlide =Provider.of<ListStacks>(context,listen: false);
                                Provider.of<Scroll>(context,listen: false).changeOffsetValueToZero();
                                _providerSlide.animatePageRemoved();
                                _providerSlide.removeWidgetList();
                                // slideAndMyList(context);
                              },
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            data.offsetValue() > 608 && data2.getEpiIndex()==0
                                ? GestureDetector(
                              onTap: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context){
                                  return SeasonScreen();
                                }));
                              },
                              child: Container(
                                color: Colors.black,
                                child: Row(
                                  children: [
                                    Text(
                                      'Season 1',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            )
                                : Container()

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}

class EpiMiniBody extends StatefulWidget {
   EpiMiniBody({
    Key? key,
    // required double screenWidth,
    required this.stackBottom,
    required this.theList,
    required this.index,
    required this.animatedContainerHeight,
    required this.theWidth,
    required this.list,
    required this.widgetList,
    required this.episodeIndex,
    required this.epiIndex
  }) :  super(key: key);

  // final double _screenWidth;
  final double stackBottom;
  final List<Content> theList;
  final int index;
  final double animatedContainerHeight;
  final List<Content> list;
  final double theWidth;
  final List widgetList;
  final int episodeIndex;
   int epiIndex;

  @override
  State<EpiMiniBody> createState() => _EpiMiniBodyState();
}
// int count =epi;
class _EpiMiniBodyState extends State<EpiMiniBody> {
  @override
  Widget build(BuildContext context) {
    final _epiProvider = Provider.of<EpiIndex>(context,listen: false);
    // print(widget.epiIndex);
    // print('epinav build');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          // alignment: Alignment.topLeft,
          children: [
            SizedBox(
              height: 10,
              width: double.infinity,
              child: Divider(
                color: Colors.white54,
              ),
            ),
            Positioned(
              left: widget.theWidth * 0.02,
              bottom: widget.stackBottom,
              child: Visibility(
                visible: true,
                child: widget.theList[widget.index].text == 'series'
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: widget.animatedContainerHeight,
                        width: widget.epiIndex != 0
                            ? 0
                            : widget.theWidth * 0.2,
                        color: Colors.red[900],
                      )
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: widget.animatedContainerHeight,
                        width: widget.epiIndex != 2
                            ? 0
                            : widget.theWidth * 0.26,
                        color: Colors.red[900],
                      ),
              ),
            ),
            Positioned(
              left: widget.theWidth * 0.25,
              bottom: widget.stackBottom,
              child: Visibility(
                visible: widget.theList[widget.index].text == 'series',
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: widget.animatedContainerHeight,
                  width: widget.epiIndex != 1
                      ? 0
                      : widget.theWidth * 0.285,
                  color: Colors.red[900],
                ),
              ),
            ),
            Positioned(
              left: widget.theWidth * 0.59,
              bottom: widget.stackBottom,
              child: Visibility(
                visible: widget.theList[widget.index].text == 'series',
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: widget.animatedContainerHeight,
                  width: widget.epiIndex != 2
                      ? 0
                      : widget.theWidth * 0.255,
                  color: Colors.red[900],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.max,
              ),
            ),
            Positioned(
              left: 15,
              child: Visibility(
                visible: widget.theList[widget.index].text == 'series',
                child: GestureDetector(
                  onTap: () {
                    if (widget.epiIndex != 0) {
                      _epiProvider.changeEpiIndex(0);
                      setState(() {
                        widget.epiIndex =0;
                      });

                    }
                  },
                  child: Container(
                    color: Colors.black,
                    width: widget.theWidth * 0.2 - 13.5,
                    child: FittedBox(
                      child: Text(
                        'EPISODES',
                        style: TextStyle(
                          color:widget.epiIndex == 0
                              ? Colors.white
                              : Colors.white54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: widget.theWidth * 0.25,
              child: Visibility(
                visible: widget.theList[widget.index].text == 'series',
                child: GestureDetector(
                  onTap: () {
                    if (widget.epiIndex != 1) {
                      _epiProvider.changeEpiIndex(1);
                      setState(() {
                        widget.epiIndex=1;
                      });

                    }
                  },
                  child: Container(
                    color: Colors.black,
                    width: widget.theWidth * 0.285,
                    child: FittedBox(
                      child: Text(
                        'TRAILERS & MORE',
                        style: TextStyle(
                          color: widget.epiIndex == 1
                              ? Colors.white
                              : Colors.white54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: widget.theList[widget.index].text == 'movie'
                  ? 11
                  : widget.theWidth * 0.59,
              child: Visibility(
                visible: widget.theList[widget.index].text == 'series' ||
                    widget.theList[widget.index].text == 'movie',
                child: GestureDetector(
                  onTap: () {
                    if (widget.epiIndex != 2) {
                      _epiProvider.changeEpiIndex(2);

                      setState(() {
                        widget.epiIndex=2;
                      });
                    }
                  },
                  child: Container(
                    color: Colors.black,
                    width: widget.theWidth * 0.255,
                    child: FittedBox(
                      child: Text(
                        'MORE LIKE THIS',
                        style: TextStyle(
                          color:widget.epiIndex == 2
                              ? Colors.white
                              : Colors.white54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Visibility(
          visible: widget.epiIndex == 0,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 8.0, right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return SeasonScreen();
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius:
                    BorderRadius.all(Radius.circular(5))),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Season 1',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        widget.epiIndex == 0
            ? ListOfEpisodes(
          screenWidth: widget.theWidth,
          theList: widget.list,
          index2: widget.episodeIndex,
        )
            : widget.widgetList[widget.epiIndex],
      ],
    );
  }
}

class ListOfEpisodes extends StatelessWidget {
  const ListOfEpisodes(
      {Key? key,
      required double screenWidth,
      required this.theList,
      required this.index2})
      : _screenWidth = screenWidth,
        super(key: key);

  final double _screenWidth;
  final List<Content> theList;
  final int index2;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 8.0, top: 8, bottom: 8, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: _screenWidth * 0.34,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(theList[index2].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(child: PlayButtonStack(height: 40, width: 40,playIconSize: 25,)),

                    ],
                  ),
                  Container(
                    height: 80,
                    width: _screenWidth * 0.50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              theList[index2].name,
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '23 min',
                              style: TextStyle(color: Colors.white38),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: _screenWidth * 0,
                      height: 85,
                      // color: Colors.red,
                      child: Icon(
                        Icons.file_download,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: _screenWidth * 0.88,
                child: Text(
                  theList[index2].description,
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}

class IconString extends StatelessWidget {
  const IconString({
    Key? key,
    required this.text,
    required this.iconSymbol,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final IconData iconSymbol;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconSymbol,
            color: Colors.white,
            size: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white70, fontSize: 11),
        )
      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton(
      {Key? key,
      required this.buttonColor,
      required this.iconSymbol,
      required this.iconColor,
      required this.textColor,
      required this.text,
      required this.onPressed,
      required this.iconSize})
      : super(key: key);

  final Color buttonColor;
  final IconData iconSymbol;
  final Color iconColor;
  final String text;
  final Color textColor;
  final Function() onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3))),
        minWidth: MediaQuery.of(context).size.width - 20,
        color: buttonColor,
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              iconSymbol,
              color: iconColor,
              size: iconSize,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
