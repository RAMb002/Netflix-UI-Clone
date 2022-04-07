import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/data/content_model.dart';
import 'package:netflix_clone/the_provider/bottom_container_menu_iconchanges.dart';
import 'package:netflix_clone/the_provider/episodes/episode_app_bar_data.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/icon.dart';
import 'package:netflix_clone/the_provider/episodes/navigation.dart';
import 'package:netflix_clone/widgets/bottom_container.dart';
import 'package:netflix_clone/widgets/bottom_container_menu.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/widgets/play_button_stack.dart';
import 'package:netflix_clone/data/content_model.dart';

const kRoundedRectangularBorderForBottomContainer = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(15), topLeft: Radius.circular(15)));

class ContinueList extends StatelessWidget {
  final List<Content> list;
  final String text;
  final bool playAndIconButtonVisibility;
  final bool bigSize;

   ContinueList({
    Key? key,
    required this.list,
    required this.playAndIconButtonVisibility,
    required this.text,
    required this.bigSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double containerWidth = MediaQuery.of(context).size.width * 0.28;


    return Padding(
      padding: EdgeInsets.only(left: 7, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bigSize
              ? Container(
                  height: 320,
                  child: ListBuilder(
                    list: list,
                    playAndIconButtonVisibility: playAndIconButtonVisibility,
                    bigSize: bigSize,
                  ),
                )
              : Container(
            // color: Colors.red,
                  height: playAndIconButtonVisibility ? containerWidth * 1.6 + 40 + 7 :  containerWidth * 1.56 + 6,
                  child: ListBuilder(
                    list: list,
                    playAndIconButtonVisibility: playAndIconButtonVisibility,
                    bigSize: bigSize,
                  ),
                ),
        ],
      ),
    );
  }
}

class ListBuilder extends StatelessWidget {
  const ListBuilder({
    Key? key,
    required this.list,
    required this.playAndIconButtonVisibility,
    required this.bigSize,
  }) : super(key: key);

  final List<Content> list;
  final bool bigSize;
  final bool playAndIconButtonVisibility;

  @override
  Widget build(BuildContext context) {

    final double _screenHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double paddingRight = 8.0;
    // double containerHeight = 145;
    double containerHeight = _screenHeight * 0.212;
    // double containerWidth =98;
    double containerWidth = MediaQuery.of(context).size.width * 0.28;
    double iconSize = 23;

    return ListView.builder(
        padding: EdgeInsets.only(
          top: 10,
        ),
        itemCount: list.length,
        // reverse: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: paddingRight),
                child: GestureDetector(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: bigSize ? 300 : containerWidth * 1.45,
                        width: bigSize ? 165 : containerWidth,
                        // height: 150,
                        // width: 110,
                        decoration: BoxDecoration(
                            borderRadius: playAndIconButtonVisibility
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6))
                                : BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                                image: AssetImage(list[index].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(child: Container(
                        height: bigSize ? 300 : containerWidth * 1.45,
                        width: bigSize ? 165 : containerWidth,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: playAndIconButtonVisibility
                                ? BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6))
                                : BorderRadius.all(Radius.circular(5)),
                            splashColor: Colors.transparent.withOpacity(0.1),
                            onTap: (){
                              showModalBottomSheet(
                                shape: kRoundedRectangularBorderForBottomContainer,
                                // useRootNavigator: true,
                                // isScrollControlled: true,
                                backgroundColor: Color(0xFF141518),
                                // Color(0xFF1C1D23),
                                context: context,
                                builder: (context) {
                                  return TheBottomContainer(list: list,index: index,);
                                },
                              );
                            },
                          ),
                        ),
                      ),),
                      Visibility(
                        visible: playAndIconButtonVisibility,
                        child: Positioned(
                          // bottom: 40,
                          child: GestureDetector(
                            onTap: (){
                              showModalBottomSheet(
                                shape: kRoundedRectangularBorderForBottomContainer,
                                // useRootNavigator: true,
                                // isScrollControlled: true,
                                backgroundColor: Color(0xFF141518),
                                // Color(0xFF1C1D23),
                                context: context,
                                builder: (context) {
                                  return TheBottomContainer(list: list,index: index,);
                                },
                              );
                            },
                            child: PlayButtonStack(height: 53, width: 53,playIconSize: 40,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: playAndIconButtonVisibility,
                child: Padding(
                  padding: EdgeInsets.only(right: paddingRight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 2.5,
                        width: containerWidth - 30,
                        color: Colors.red.shade800,
                      ),
                      Container(
                        height: 2.5,
                        width:  30,
                        color: Colors.white54,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: playAndIconButtonVisibility,
                child: Padding(
                  padding: EdgeInsets.only(right: paddingRight),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF141518),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    width: containerWidth,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            final _provider = Provider.of<EpisodeListIndex>(
                                context,
                                listen: false);
                            final _provider2 = Provider.of<EpisodeNavigation>(
                                context,
                                listen: false);
                            _provider2.changeNavigationIndex(0);
                            Provider.of<EpisodeInfo>(context, listen: false)
                                .changeEpisodeIndexValue(1);
                            Provider.of<EpisodeInfo>(context, listen: false)
                                .changeEpisodeInfoDataToTrue();
                            _provider.changeIndex(index);
                            _provider.changeList(list);
                            if (_provider
                                    .getList()[_provider.getListIndex()]
                                    .text ==
                                'movie') {
                              _provider2.changeNavigationIndex(2);
                            }
                            Provider.of<EpisodeAppBarData>(context,
                                    listen: false)
                                .changeOffsetValueToZero();
                            final iconProvider =
                                Provider.of<IconChange>(context, listen: false);
                            bool exists = myList2.any((file) =>
                                file.name ==
                                _provider
                                    .getList()[_provider.getListIndex()]
                                    .name);
                            iconProvider.changeMyListIcon(exists);
                          },
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: Colors.white,
                            size: iconSize,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  shape:
                                      kRoundedRectangularBorderForBottomContainer,
                                  backgroundColor: Color(0xFF141518),
                                  context: context,
                                  builder: (context) {
                                    return BottomContainerMenu(
                                        list: list, index: index);
                                  }).whenComplete(() {
                                final provider =
                                    Provider.of<BottomContainerMenuIconChanges>(
                                        context,
                                        listen: false);
                                if (!provider.getLikeIcon()) {
                                  provider.changeLikeIcon();
                                }
                                if (!provider.getDislikeIcon()) {
                                  provider.changeDislikeIcon();
                                }
                                Provider.of<EpisodeAppBarData>(context,
                                        listen: false)
                                    .changeOffsetValueToZero();

                                // print('Hey there, I\'m calling after hide bottomSheet');
                              });
                            },
                            icon: Icon(
                              Icons.more_vert_sharp,
                              color: Colors.white,
                              size: iconSize,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6,)
            ],
          );
        });
  }
}



class TheBottomContainer extends StatelessWidget {
  const TheBottomContainer({
    Key? key,
    required this.list,
    required this.index
  }) : super(key: key);

  final List<Content> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomContainer(
      list: list,
      index: index,
      onTap: () {
        final _provider = Provider.of<EpisodeListIndex>(
            context,
            listen: false);

        Provider.of<EpisodeAppBarData>(context,
            listen: false)
            .changeOffsetValueToZero();
        Navigator.pop(context);
        // final _provider =Provider.of<EpisodeListIndex>(context,listen: false);
        final _provider2 = Provider.of<EpisodeNavigation>(
            context,
            listen: false);
        _provider2.changeNavigationIndex(0);
        Provider.of<EpisodeInfo>(context, listen: false)
            .changeEpisodeIndexValue(1);
        Provider.of<EpisodeInfo>(context, listen: false)
            .changeEpisodeInfoDataToTrue();
        _provider.changeIndex(index);
        _provider.changeList(list);
        if (_provider
            .getList()[_provider.getListIndex()]
            .text ==
            'movie') {
          _provider2.changeNavigationIndex(2);
        }
        final iconProvider =
        Provider.of<IconChange>(context, listen: false);
        bool exists = myList2.any((file) =>
        file.name ==
            _provider
                .getList()[_provider.getListIndex()]
                .name);
        iconProvider.changeMyListIcon(exists);
      },
    );
  }
}
