import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/screens/main_screens/comingsoon_screen.dart';
import 'package:netflix_clone/screens/main_screens/downloads_screen.dart';
import 'package:netflix_clone/screens/main_screens/more_screen.dart';
import 'package:netflix_clone/screens/ontap_nav_text.dart';
import 'package:netflix_clone/screens/main_screens/search_screen/search_screen.dart';
import 'package:netflix_clone/screens/season_screen.dart';
import 'package:netflix_clone/the_provider/download_screen/page_animation.dart';
import 'package:netflix_clone/the_provider/episodes/episode_app_bar_data.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/the_provider/episodes/icon.dart';
import 'package:netflix_clone/the_provider/episodes/navigation.dart';
import 'package:netflix_clone/the_provider/episodes/ontap_list.dart';
import 'package:netflix_clone/the_provider/episodes/slide_animation.dart';
import 'package:netflix_clone/the_provider/morescreen_list.dart';
import 'package:netflix_clone/the_provider/mylist_provider.dart';
import 'package:netflix_clone/the_provider/mylist_slide.dart';
import 'package:netflix_clone/the_provider/nested_scroll_controller.dart';
import 'package:netflix_clone/the_provider/search_screen_text/epi_list.dart';
import 'package:netflix_clone/the_provider/search_screen_text/list_stacks.dart';
import 'package:netflix_clone/the_provider/search_screen_text/scroll.dart';
import 'package:netflix_clone/the_provider/search_screen_text/search_finish.dart';
import 'package:netflix_clone/widgets/appbars/appbar_dowloadscreen.dart';
import 'package:netflix_clone/widgets/bottom_navigation_container.dart';
import 'package:netflix_clone/widgets/continue_list.dart';
import 'package:netflix_clone/widgets/appbars/custom_app_bar.dart';
import 'package:netflix_clone/screens/episode_info_screen.dart';
import 'package:netflix_clone/widgets/main_section.dart';
import 'package:netflix_clone/widgets/bottom_container.dart';
import 'package:netflix_clone/widgets/my_list.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/the_provider/backend.dart';
import 'package:netflix_clone/the_provider/bottom_nav_bar_provider.dart';
import 'package:netflix_clone/screens/main_page.dart';

class HomeScreen extends StatefulWidget {
  static const valueKey = ValueKey('HomeScreen');

  HomeScreen({Key? key,required this.activeName}) : super(key: key);

  final String activeName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
//   late AnimationController _animationController;
// late Animation<Offset> _animation;
  int _currentIndex = 0;
  // int key=0;

  @override
  void initState() {
    _scrollController = Provider.of<OnTapListValues>(context,listen: false).getScrollController()
      ..addListener(() {
        Provider.of<EpisodeAppBarData>(context, listen: false)
            .changeOffSetValue(_scrollController);
      });
    myScroll();
    // bool shit = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
    // _animationController.dispose();
  }

  void myScroll() async {
    final _providerEpisode =
        Provider.of<EpisodeAppBarData>(context, listen: false);

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_providerEpisode.isScrollingDown()) {
          _providerEpisode.changeIsScrollingDownValue();
          ;
          _providerEpisode.changeAppBarValue();
          // print(_providerEpisode.showAppBar());
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_providerEpisode.isScrollingDown()) {
          _providerEpisode.changeIsScrollingDownValue();
          _providerEpisode.changeAppBarValue();
          // print(_providerEpisode.showAppBar());

        }
      }
    });
  }

  void nextPage(Backend data, MyListProvider yolo) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) {
          return OnTapNavText(
            onTapTvShowValue: data.onTapTvValue(),
            onTapMovieValue: data.onTapMovieValue(),
            onTapMyListValue: yolo.onTapMyListValue(),
          );
        },
      ),
    );
  }
   void slideAndMyList(BuildContext context) {
    Provider.of<SlideAnimation>(context,
        listen: false)
        .changeSlideTransitionAnimationEnd(1);
    final listProvider = Provider.of<EpisodeListIndex>(context,listen: false);
    final iconProvider =
    Provider.of<IconChange>(context, listen: false);
    if (!iconProvider.getLikeIcon()) {
      iconProvider.changeLikeIcon();
    }
    // if (!iconProvider.getMyListIcon()) {
    //   iconProvider.changeMyListIcon();
    // }
    if(iconProvider.getOnTouched() ){
      if(iconProvider.getMyListIcon()){

        for(int i=0;i<myList2.length;i++){
          if(myList2[i].name==listProvider.getList()[listProvider.getListIndex()].name){
            // listProvider.getList()[listProvider.getListIndex()].myListCheck = true;
            myList2.add(listProvider.getList()[listProvider.getListIndex()]);

            // myList2[i].myListCheck = false;
            myList2.removeAt(i);
            // Provider.of<EpiList>(context,listen: false).changeBaka();

            iconProvider.changeOnTouchedToFalse();
            break;
          }
        }
        if(iconProvider.getOnTouched()){
          // listProvider.getList()[listProvider.getListIndex()].myListCheck = true;
          // print(listProvider.getList()[listProvider.getListIndex()].myListCheck);
          myList2.add(listProvider.getList()[listProvider.getListIndex()]);
          // Provider.of<EpiList>(context,listen: false).changeBaka();

          // myList2.last.myListCheck=true;
        }
        // myList.removeAt(index)
      }
      if(!iconProvider.getMyListIcon()){
        print(myList2.length);
        for(int i=0;i<myList2.length+10;i++){
          try{

            if(myList2[i].name==listProvider.getList()[listProvider.getListIndex()].name && myList2.length >4){
              // print(myList2.length);
              // myList2[i].myListCheck = false;
              // print(listProvider.getList()[listProvider.getListIndex()].myListCheck);

              myList2.removeAt(i);
              listProvider.changeIndex(0);
              // Provider.of<EpiList>(context,listen: false).changeBaka();

              break;

            }}catch(e){

          }
        }
      }
    }
    iconProvider.changeOnTouchedToFalse();
  }


  @override
  Widget build(BuildContext context) {
    print('homebuild');

    final _screenWidth = MediaQuery.of(context).size.width;

    List<SliverToBoxAdapter> appBarWidgets = [];
    appBarWidgets = [
      SliverToBoxAdapter(
        child: Container(
          height: 50,
          child: Consumer<Backend>(
            builder: (context, data, child) {
              // print(data.alignment());
              return Consumer<MyListProvider>(
                builder: (context, yolo, child) {
                  return CustomAppBar(
                    onEnd1: () {
                      if (data.onTapGeneralValue()) {
                        // data.changeOnTapGeneralValue();
                        data.changeTvShowsGenreVisibilityValue();
                        data.changeFakeExpandedBoxesValue();
                      }
                      if (data.onTapGeneralValue() == false) {
                        data.changeOnTapTvValueToFalse();
                      }
                    },
                    onEnd2: () {
                      // print('111111');
                      if (data.onTapGeneralValue()) {
                        data.changeMovieFakeExpanded();
                        data.changeMovieGenreVisibilityValue();
                        // print(data.movieGenreVisibility());
                      }
                      if (data.onTapGeneralValue() == false) {
                        // print('fassss');
                        data.changeOnTapMovieValueToFalse();
                      }
                    },

                    alignment: data.alignment(),
                    onTap1: () {
                      // data.changeOnTop('TV Shows');
                      if (data.onTapTvValue() == false) {
                        data.changeOnTapTvValueToTrue();
                        data.changeAlignment(Alignment.centerLeft);
                        data.changeOnTapGeneralValue();
                      }
                      if (data.tvShowsGenreVisibility()) {
                        nextPage(data, yolo);
                        // print('hi');
                      }
                      // data.changeTrialValue();
                    },
                    onTap2: () {
                      if (data.onTapMovieValue() == false) {
                        data.changeOnTapMovieValueToTrue();
                        data.changeAlignment(Alignment.centerLeft);
                        data.changeOnTapGeneralValue();
                      }
                      if (data.movieGenreVisibility()) {
                        nextPage(data, yolo);
                      }

                      // data.changeTrialValue();
                    },
                    onEnd3: () {
                      // print('000000');
                      if (data.onTapGeneralValue()) {
                        // print('hiiiii');
                        data.changeMyListGenreVisibility();
                        // data.changeAlignment(Alignment.center);

                      }
                      if (data.onTapGeneralValue() == false) {
                        // print('got in');
                        data.changeAlignment(Alignment.center);
                        if (yolo.getOnTapIconValue()) {
                          yolo.changeOnTapMyListValueToFalse();
                          yolo.changeOnTapIconValue();
                        }
                        // print(yolo.onTapMyListValue());

                      }
                    },
                    onTap3: () async {
                      if (data.myListGenreVisibility() == false) {
                        data.specialChangeAlignment();
                        await Future.delayed(Duration(milliseconds: 450));
                        yolo.changeOnTapMyListValueToTrue();
                        await Future.delayed(Duration(milliseconds: 100));

                        data.changeAlignment(Alignment.centerLeft);
                        // // print('dssssss');
                        // // print(yolo.onTapMyListValue());
                        data.changeOnTapGeneralValue();
                      }
                      if (data.myListGenreVisibility()) {
                        print(data.myListGenreVisibility());
                        nextPage(data, yolo);
                        // print(yolo.onTapMyListValue());
                      }
                    },

                    onTapTvShowValue: data.onTapTvValue(),
                    onTapMovieValue: data.onTapMovieValue(),
                    onTapMyListValue: yolo.onTapMyListValue(),
                    // showAppBar: data.showAppBar(),
                    // offset: data.offsetValue(),
                  );
                },
              );
            },
          ),
        ),
      ),
    ];

    List<Widget> firstScreen = [];
    if (Provider.of<MyListProvider>(context).onTapMyListValue()) {
      firstScreen = [
        ListView(
          // controller: _scrollController,
          children: [
            MyList(
              screenWidth: _screenWidth,
              list: myList2,
            )
          ],
        ),
      ];
    } else {
      // print('bello');
      firstScreen = [
        MainPage(activeName: widget.activeName,),
      ];
    }
    final List allWidgets = [
      Container(),
      SearchScreen(),
      ComingSoonScreen(),
      Downloads(),
      More(),
    ];

    final provider = Provider.of<BottomNavBarProvider>(context, listen: false);
    final providerBackend = Provider.of<Backend>(context, listen: false);
    final providerMyList = Provider.of<MyListProvider>(context, listen: false);
    final providerIndex = Provider.of<BottomNavBarProvider>(context).indexValue();
    final providerEpisode = Provider.of<EpisodeInfo>(context);
    final providerMoreMyList = Provider.of<MoreScreenList>(context);
    final providerAnimatePage = Provider.of<ListStacks>(context, listen: false);
    final _offsetProvider = Provider.of<Scroll>(context, listen: false);

    final realAppBars = [
      PreferredSize(
        preferredSize: Size(_screenWidth, 50),
        child: AppBarDownloadScreen(),
      ),
      PreferredSize(
        preferredSize: Size(_screenWidth, 50),
        child: Consumer<EpisodeAppBarData>(
          builder: (context, data, child) {
            // print('shit');
            return Consumer<EpisodeNavigation>(
              builder: (context, data2, child) {
                return Container(
                  height: 100,
                  color: Colors.black.withOpacity(
                      (data.offsetValue() / 300).clamp(0, 1).toDouble()),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            slideAndMyList(context);
                          },
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        data.offsetValue() > 608 &&
                                data2.getNavigationIndex() ==0
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
                );
              },
            );
          },
        ),
      ),
      AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(icon : Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: (){
          Provider.of<MyListSlideAnimation>(context,listen: false).changeSlideTransitionAnimationEnd(1);

        },),
        title: Text('My List',style: TextStyle(
          color: Colors.white,
        ),),
      )
    ];

    return WillPopScope(
      onWillPop: () async {
        final _providerMoreScreenList =Provider.of<MoreScreenList>(context,listen: false);
        final _providerMyListSlideAnimation =Provider.of<MyListSlideAnimation>(context,listen: false);
        final _providerSlide =Provider.of<ListStacks>(context,listen: false);
        final _providerDownloadAnimation = Provider.of<PageAnimation>(context,listen: false);
        // if( Provider.of<EpisodeInfo>(context,listen: false).getLuckyNumber()==2){
        //   Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeIndexValue(0);
        //   return false;
        // }
        // if(_providerSlide.getOffsetList().length>1){
        //   _providerSlide.changeCloneCount(_providerSlide.getCount());
        //   _providerSlide.changeOffsetToOneHide();
        //   print(_providerSlide.getOffsetList());
        //   // print('removed');
        //   //
        //   // print(_providerSlide.getOffsetList());
        //
        //   _providerSlide.changeHideStatusToTrue();
        //   // Future.delayed(Duration(seconds: 1));
        //   _providerSlide.changeCloneCount(_providerSlide.getCount());
        //   _providerSlide.decrementCount();
        //
        //   return false;
        // }
        if(provider.indexValue() ==3 && _providerDownloadAnimation.getPageStats()){
          _providerDownloadAnimation.changePageStats(false);
          return false;
        }
        if(provider.indexValue() ==1 && _providerSlide.getWidgetList().length>1){
          Provider.of<Scroll>(context,listen: false).changeOffsetValueToZero();
          _providerSlide.animatePageRemoved();

          _providerSlide.removeWidgetList();
          return false;
        }
        if (providerIndex == 0 &&
            Provider.of<EpisodeInfo>(context, listen: false)
                .episodeInfoData()) {
          slideAndMyList(context);


          return false;
        }
        if (providerIndex == 4 &&
            Provider.of<EpisodeInfo>(context, listen: false)
                .episodeInfoData()) {
          slideAndMyList(context);
          // Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeIndexValue(2);
          // print(Provider.of<EpisodeInfo>(context,listen: false).episodeIndexValue());

          return false;
        }

         if(_providerMoreScreenList.getMoreOnTapList() && providerIndex ==4){
          _providerMyListSlideAnimation.changeSlideTransitionAnimationEnd(1);
          return false;

        }
        if (providerMyList.onTapMyListValue() && provider.indexValue() == 0) {
          Provider.of<NestedScrollController>(context,listen: false).changeScrollValueToZero();
          Provider.of<MyListProvider>(context, listen: false)
              .changeOnTapIconValue();
          CustomAppBar.changeMyListToNormal(providerBackend);
          return false;
        }
        if (providerBackend.onTapMovieValue() && provider.indexValue() == 0) {
          Provider.of<NestedScrollController>(context,listen: false).changeScrollValueToZero();
          CustomAppBar.changeMoviesToNormal(providerBackend);
          return false;
        }
        if (providerBackend.onTapTvValue() && provider.indexValue() == 0) {
          Provider.of<NestedScrollController>(context,listen: false).changeScrollValueToZero();
          CustomAppBar.changeTvShowsToNormal(providerBackend);
          return false;
        }
        //  if(provider.getList().isEmpty && providerBackend.onTapTvValue()){
        //   CustomAppBar.changeTvShowsToNormal(providerBackend);
        //   return false;
        // }
        //  if(provider.getList().isEmpty && providerBackend.onTapMovieValue()){
        //   CustomAppBar.changeMoviesToNormal(providerBackend);
        //   return false;
        //
        // }
        //  if(provider.getList().isEmpty && providerMyList.onTapMyListValue()){
        //   CustomAppBar.changeMyListToNormal(providerBackend);
        //   return false;
        //
        // }
        else if (provider.getList().isEmpty) {
          return true;
        } else {
          provider.removeLastIndex();
          if (provider.getList().isEmpty) {
            provider.changeIndexValue(0);
            if (Provider.of<EpisodeInfo>(context, listen: false)
                    .getLuckyNumber() ==
                2) {
              Provider.of<EpisodeInfo>(context, listen: false)
                  .changeEpisodeInfoDataToTrue();
              Provider.of<EpisodeInfo>(context, listen: false)
                  .changeEpisodeIndexValue(1);
              Provider.of<EpisodeInfo>(context, listen: false)
                  .changeLuckyNumber(0);
            }
            return false;
          } else {
            int i = provider.getLastIndexValueInList();
            // print(i);
            final _providerEpisodeInfo = Provider.of<EpisodeInfo>(context, listen: false);

            if(i==4 && _providerMoreScreenList.getMoreOnTapList()){
              _providerEpisodeInfo.changeEpisodeIndexValue(2);
              provider.changeIndexValue(i);

              return false;

            }
            // if(i==1 && providerAnimatePage.getWidgetList().length>1 ){
            //   provider.changeIndexValue(1);
            //   if(provider.indexValue()==1) {
            //     WidgetsBinding.instance?.addPostFrameCallback((_){
            //       providerAnimatePage.animatePage();
            //       _offsetProvider.changeOffsetValueToZero();
            //     });
            //     return false;
            //   }
            //
            //   // return false;
            //
            // }
            if (i == 0 &&
                _providerEpisodeInfo.getLuckyNumber() == 2) {
              _providerEpisodeInfo.changeEpisodeInfoDataToTrue();
              _providerEpisodeInfo.changeEpisodeIndexValue(1);
              provider.changeIndexValue(i);
              _providerEpisodeInfo.changeLuckyNumber(0);
              Provider.of<EpisodeAppBarData>(context,listen: false).changeOffsetValueToZero();
              // Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeIndexValue(0);
              return false;
            } else {
              _providerEpisodeInfo.changeEpisodeInfoDataToFalse();
              if(providerAnimatePage.getWidgetList().length==1 &&
                  Provider.of<SearchFinish>(context,listen: false).getFinish()
              ) {
                PageController _pageController = PageController(
                    initialPage: 0, keepPage: true);
                Provider.of<ListStacks>(context, listen: false)
                    .changePageController(_pageController);
                Provider.of<SearchFinish>(context,listen: false).changeFinish(false);
              }
              Provider.of<Scroll>(context, listen: false).changeOffsetValueToZero();

              _providerEpisodeInfo.changeEpisodeIndexValue(0);

              provider.changeIndexValue(i);
              // print(provider.indexValue());
              Provider.of<EpisodeInfo>(context, listen: false).changeEpisodeIndexValue(0);
              // provider.removeLastIndex();
              return false;
            }
          }
        }
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: providerIndex == 3 || providerEpisode.episodeInfoData() || providerIndex==4 &&
            providerMoreMyList.getMoreOnTapList() ? realAppBars[providerEpisode.episodeIndexValue()]
            : null,
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomNavigationContainer(),
        body: !Provider.of<EpisodeInfo>(context).episodeInfoData()
            ? SafeArea(
                child: providerIndex == 0
                    ? Consumer<NestedScrollController>(
                  builder: (context,scroll,child){
                    return NestedScrollView(
                      controller: scroll.getScrollController(),
                      // controller: _scrollController,
                      floatHeaderSlivers: true,

                      headerSliverBuilder: (context, shit) =>
                      [appBarWidgets[providerIndex]],

                      body: firstScreen[0],
                    );
                  },

                    )
                    : allWidgets[Provider.of<BottomNavBarProvider>(context)
                        .indexValue()],
              )
            : EpisodeInfoScreen(),
      ),
    );
  }


}
