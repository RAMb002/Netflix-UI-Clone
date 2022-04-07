import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/main_screens/home_screen.dart';
import 'package:netflix_clone/screens/main_screens/search_screen/search_screen.dart';
import 'package:netflix_clone/the_provider/backend.dart';
import 'package:netflix_clone/the_provider/bottom_nav_bar_provider.dart';
import 'package:netflix_clone/the_provider/comingsoon_screen/my_list.dart';
import 'package:netflix_clone/the_provider/episodes/episode_app_bar_data.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/the_provider/episodes/icon.dart';
import 'package:netflix_clone/the_provider/episodes/slide_animation.dart';
import 'package:netflix_clone/the_provider/morescreen_list.dart';
import 'package:netflix_clone/the_provider/mylist_provider.dart';
import 'package:netflix_clone/the_provider/nested_scroll_controller.dart';
import 'package:netflix_clone/the_provider/search_screen_text/list_stacks.dart';
import 'package:netflix_clone/the_provider/search_screen_text/scroll.dart';
import 'package:netflix_clone/the_provider/search_screen_text/search_finish.dart';
import 'package:netflix_clone/widgets/appbars/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/data/Data.dart';


const kTextSyle = TextStyle(
  color: Colors.white30,
  fontSize: 10,
);
const kActiveTextStyle = TextStyle(color: Colors.white, fontSize: 10);

class BottomNavigationContainer extends StatelessWidget {
  BottomNavigationContainer({Key? key}) : super(key: key);

  Color inactiveColor = Colors.white30;
  Color activeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _providerTruth = Provider.of<EpisodeInfo>(context,listen: false);
    final providerAnimatePage = Provider.of<ListStacks>(context,listen: false);


    return Consumer<BottomNavBarProvider>(
      builder: (context, data, child) {
        return Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: 10, left: 30, right: 20),
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomIcons(
                  text: 'Home',
                  onTap: () {
                    // if(_providerTruth.episodeInfoData()) {
                    //   _providerTruth.changeEpisodeInfoDataToFalse();
                    //   _providerTruth.changeEpisodeIndexValue(0);
                    // }
                    final providerMyList = Provider.of<MyListProvider>(context, listen: false);
                    final provider = Provider.of<BottomNavBarProvider>(context, listen: false);
                    final providerBackend = Provider.of<Backend>(context, listen: false);

                    if(Provider.of<EpisodeInfo>(context, listen: false).episodeInfoData()){
                        Provider.of<SlideAnimation>(context,
                            listen: false)
                            .changeSlideTransitionAnimationEnd(1);
                        final listProvider = Provider.of<EpisodeListIndex>(context,listen: false);
                        final iconProvider =
                        Provider.of<IconChange>(context, listen: false);
                        if (!iconProvider.getLikeIcon()) {
                          iconProvider.changeLikeIcon();
                        }

                        if(iconProvider.getOnTouched() ){
                          if(iconProvider.getMyListIcon()){

                            for(int i=0;i<myList2.length;i++){
                              if(myList2[i].name==listProvider.getList()[listProvider.getListIndex()].name){
                                myList2.add(listProvider.getList()[listProvider.getListIndex()]);
                                myList2.removeAt(i);
                                iconProvider.changeOnTouchedToFalse();
                                break;
                              }
                            }
                            if(iconProvider.getOnTouched()){
                              myList2.add(listProvider.getList()[listProvider.getListIndex()]);
                            }
                            // myList.removeAt(index)
                          }
                          if(!iconProvider.getMyListIcon()){
                            print(myList2.length);
                            for(int i=0;i<myList2.length+10;i++){
                              try{

                                if(myList2[i].name==listProvider.getList()[listProvider.getListIndex()].name && myList2.length >4){
                                  // print(myList2.length);
                                  myList2.removeAt(i);
                                  listProvider.changeIndex(0);
                                  break;

                                }}catch(e){

                              }
                            }
                          }
                        }
                        iconProvider.changeOnTouchedToFalse();

                    }
                     if(_providerTruth.getLuckyNumber()==2){
                      print('got in');
                      _providerTruth.changeEpisodeInfoDataToTrue();
                      Provider.of<EpisodeAppBarData>(context,listen: false).changeOffsetValueToZero();
                      _providerTruth.changeEpisodeIndexValue(1);
                      _providerTruth.changeLuckyNumber(0);
                      print('changed');
                    }

                    if (providerMyList.onTapMyListValue() && provider.indexValue() == 0 &&
                        !Provider.of<EpisodeInfo>(context, listen: false).episodeInfoData()) {
                      Provider.of<NestedScrollController>(context,listen: false).changeScrollValueToZero();
                      Provider.of<MyListProvider>(context, listen: false)
                          .changeOnTapIconValue();
                      CustomAppBar.changeMyListToNormal(providerBackend);
                    }
                    if (providerBackend.onTapMovieValue() && provider.indexValue() == 0 &&
                        !Provider.of<EpisodeInfo>(context, listen: false).episodeInfoData()) {
                      Provider.of<NestedScrollController>(context,listen: false).changeScrollValueToZero();
                      CustomAppBar.changeMoviesToNormal(providerBackend);
                    }
                    if (providerBackend.onTapTvValue() && provider.indexValue() == 0 &&
                        !Provider.of<EpisodeInfo>(context, listen: false).episodeInfoData()) {
                      Provider.of<NestedScrollController>(context,listen: false).changeScrollValueToZero();
                      CustomAppBar.changeTvShowsToNormal(providerBackend);
                    }




                    if(_providerTruth.getLuckyNumber()==2){
                      print('got in');
                      _providerTruth.changeEpisodeInfoDataToTrue();
                      Provider.of<EpisodeAppBarData>(context,listen: false).changeOffsetValueToZero();
                      _providerTruth.changeEpisodeIndexValue(1);
                      _providerTruth.changeLuckyNumber(0);
                      print('changed');
                    }


                    if(data.indexValue()!=0) {
                      data.changeIndexValue(0);
                      data.addIndexInList(0);
                    }
                    if(!Provider.of<EpisodeInfo>(context, listen: false).episodeInfoData()&&
                        !providerMyList.onTapMyListValue() && provider.indexValue() == 0 &&
                        !providerBackend.onTapMovieValue() && !providerBackend.onTapTvValue()&&
                        _providerTruth.getLuckyNumber()!=2 ){
                      try {
                        // WidgetsBinding.instance?.addPostFrameCallback((_){
                        if ( Provider.of<NestedScrollController>(
                            context, listen: false).getScrollController().hasClients) {
                          Provider.of<NestedScrollController>(
                              context, listen: false).changeScrollValueToZero();
                        }

                        // });

                      }catch(e){
                        print('exception occured - $e');
                      }

                    }

                  },
                  icon: Icon(Icons.other_houses_outlined,
                      color: data.indexValue() == 0 ? activeColor : inactiveColor,
                      size: 23),
                  textStyle: data.indexValue() == 0 ? kActiveTextStyle : kTextSyle),
              SizedBox(
                width: _screenWidth * 0.12,
              ),
              BottomIcons(
                  text: 'Search',
                  onTap: () {
                    if(providerAnimatePage.getWidgetList().length>1){
                      Provider.of<Scroll>(context, listen: false).changeOffsetValueToZero();

                      // WidgetsBinding.instance?.addPostFrameCallback((_){
                      //   providerAnimatePage.jumpToLastPage();
                      //   final _offsetProvider = Provider.of<Scroll>(context,listen: false);
                      //   _offsetProvider.changeOffsetValueToZero();
                      //
                      //
                      // });
                    //
                    //
                    }
                    if(providerAnimatePage.getWidgetList().length==1 &&
                        Provider.of<SearchFinish>(context,listen: false).getFinish()
                    ) {
                      PageController _pageController = PageController(
                          initialPage: 0, keepPage: true);
                      Provider.of<ListStacks>(context, listen: false)
                          .changePageController(_pageController);
                      Provider.of<SearchFinish>(context,listen: false).changeFinish(false);
                    }






                    if(_providerTruth.episodeInfoData()){
                      _providerTruth.changeLuckyNumber(2);
                    }

                    if(_providerTruth.episodeInfoData()) {
                      _providerTruth.changeEpisodeInfoDataToFalse();
                      _providerTruth.changeEpisodeIndexValue(0);
                    }

                    if(data.indexValue()!=1) {
                      data.changeIndexValue(1);
                      data.addIndexInList(1);
                    }



                  },
                  icon: Icon(Icons.search,
                      color: data.indexValue() == 1 ? activeColor : inactiveColor,
                      size: 23),
                  textStyle: data.indexValue() == 1 ? kActiveTextStyle : kTextSyle),
              SizedBox(
                width: _screenWidth * 0.09,
              ),
              BottomIcons(
                  text: 'Coming Soon',
                  onTap: () {
                    Provider.of<MyList>(context,listen: false).changeSlideValue(0);
                    if(_providerTruth.episodeInfoData()){
                      _providerTruth.changeLuckyNumber(2);
                    }
                    if(_providerTruth.episodeInfoData()) {
                      _providerTruth.changeEpisodeInfoDataToFalse();
                      _providerTruth.changeEpisodeIndexValue(0);
                    }


                    if(data.indexValue()!=2) {
                      data.changeIndexValue(2);
                      data.addIndexInList(2);
                    }

                  },
                  icon: Icon(Icons.video_library_outlined,
                      color: data.indexValue() == 2 ? activeColor : inactiveColor,
                      size: 23),
                  textStyle: data.indexValue() == 2 ? kActiveTextStyle : kTextSyle),
              SizedBox(
                width: _screenWidth * 0.08,
              ),
              BottomIcons(
                  text: 'Downloads',
                  onTap: () {
                    if(_providerTruth.episodeInfoData()){
                      _providerTruth.changeLuckyNumber(2);
                    }
                    if(_providerTruth.episodeInfoData()) {
                      _providerTruth.changeEpisodeInfoDataToFalse();
                      _providerTruth.changeEpisodeIndexValue(0);
                    }

                    if(data.indexValue()!=3) {

                      Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeIndexValue(0);
                      data.changeIndexValue(3);
                      data.addIndexInList(3);
                    }

                  },
                  icon: Icon(Icons.file_download,
                      color: data.indexValue() == 3 ? activeColor : inactiveColor,
                      size: 23),
                  textStyle: data.indexValue() == 3 ? kActiveTextStyle : kTextSyle),
              SizedBox(
                width: _screenWidth * 0.1,
              ),
              BottomIcons(
                  text: 'More',
                  onTap: () {
                    if(data.indexValue()!=4 ||  !Provider.of<MoreScreenList>(context, listen: false).getMoreOnTapList()) {
                      if (_providerTruth.episodeInfoData()) {
                        _providerTruth.changeLuckyNumber(2);
                        // Provider.of<EpisodeAppBarData>(context,listen: false).changeOffsetValueToZero();
                      }
                      if(_providerTruth.episodeInfoData()) {
                        _providerTruth.changeEpisodeInfoDataToFalse();
                        _providerTruth.changeEpisodeIndexValue(0);
                      }

                      if (Provider.of<MoreScreenList>(context, listen: false)
                          .getMoreOnTapList()) {
                        _providerTruth.changeEpisodeIndexValue(2);
                      }

                      if (data.indexValue() != 4) {
                        data.changeIndexValue(4);
                        data.addIndexInList(4);
                      }
                    }
                  },
                  icon: Icon(Icons.menu,
                      color: data.indexValue() == 4 ? activeColor : inactiveColor,
                      size: 23),
                  textStyle: data.indexValue() == 4 ? kActiveTextStyle : kTextSyle),
            ],
          ),
        );
      },
    );
  }
}

class BottomIcons extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Icon icon;
  final TextStyle textStyle;
  const BottomIcons({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            icon,
            SizedBox(
              height: 6,
            ),
            Text(
              text,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
