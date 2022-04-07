import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/data/content_model.dart';
import 'package:netflix_clone/screens/episode_info_screen.dart';
import 'package:netflix_clone/the_provider/episodes/episode_app_bar_data.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/the_provider/episodes/icon.dart';
import 'package:netflix_clone/the_provider/episodes/navigation.dart';
import 'package:netflix_clone/the_provider/episodes/ontap_list.dart';
import 'package:netflix_clone/widgets/bottom_container.dart';
import 'package:provider/provider.dart';

class MyList extends StatelessWidget {
  final double screenWidth;
  final List<Content> list;
  MyList({Key? key, required this.screenWidth, required this.list})
      : super(key: key);

  static List<Widget> myListContainers(
      List<Content> list, double screenWidth, BuildContext context) {
    List<Widget> theList = [];
    for (int i = 0; i < list.length; i++) {
      final container = Stack(
        children: [
          Container(
            padding: EdgeInsets.only(right: 7),
            height: MediaQuery.of(context).size.height * 0.25,
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(list[i].imageUrl),
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
              child: Container(
                // padding: EdgeInsets.only(right: 7),
                height: MediaQuery.of(context).size.height * 0.25,
                width: screenWidth * 0.3,
                child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                  splashColor: Colors.black.withOpacity(0.1),
                  onTap: (){
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
                            if (Provider.of<EpisodeInfo>(context, listen: false)
                                .episodeInfoData()) {
                              print('got in');
                              Provider.of<OnTapListValues>(context, listen: false)
                                  .changeScrollOffsetToZero();
                            }
                            Provider.of<EpisodeAppBarData>(context, listen: false)
                                .changeOffsetValueToZero();
                            Navigator.pop(context);

                            final _provider =
                            Provider.of<EpisodeListIndex>(context, listen: false);
                            final _provider2 =
                            Provider.of<EpisodeNavigation>(context, listen: false);
                            _provider2.changeNavigationIndex(0);
                            Provider.of<EpisodeInfo>(context, listen: false)
                                .changeEpisodeIndexValue(1);
                            Provider.of<EpisodeInfo>(context, listen: false)
                                .changeEpisodeInfoDataToTrue();
                            _provider.changeIndex(i);
                            _provider.changeList(list);
                            if (_provider.getList()[_provider.getListIndex()].text ==
                                'movie') {
                              _provider2.changeNavigationIndex(2);
                              Provider.of<EpisodeAppBarData>(context, listen: false)
                                  .changeOffsetValueToZero();
                              final iconProvider =
                              Provider.of<IconChange>(context, listen: false);
                              bool exists = myList2.any((file) =>
                              file.name ==
                                  _provider.getList()[_provider.getListIndex()].name);
                              iconProvider.changeMyListIcon(exists);
                            }
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7, left: 10),
      child: Wrap(
          spacing: 9,
          runSpacing: 9,
          direction: Axis.horizontal,
          children: myListContainers(list, screenWidth, context)),
    );
  }
}
