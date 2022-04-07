import 'package:flutter/material.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/data/content_model.dart';
import 'package:netflix_clone/the_provider/bottom_container_menu_iconchanges.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/the_provider/episodes/icon.dart';
import 'package:netflix_clone/the_provider/episodes/navigation.dart';
import 'package:provider/provider.dart';

class BottomContainerMenu extends StatelessWidget {
  const BottomContainerMenu({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  final List<Content> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      // height: 300,
      child: Consumer<BottomContainerMenuIconChanges>(
        builder: (context,data,child){
          return   Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list[index].name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.grey[850],
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              iconRow(
                iconSymbol: Icons.info_outline,
                text: 'Episodes & info',
                onTap: () {
                  Navigator.pop(context);
                  final _provider =Provider.of<EpisodeListIndex>(context,listen: false);
                  final _provider2 = Provider.of<EpisodeNavigation>(context,listen: false);
                  _provider2.changeNavigationIndex(0);
                  Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeIndexValue(1);
                  Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeInfoDataToTrue();
                  _provider.changeIndex(index);
                  _provider.changeList(list);
                  if(_provider.getList()[_provider.getListIndex()].text=='movie'){
                    _provider2.changeNavigationIndex(2);
                  }
                  final iconProvider =Provider.of<IconChange>(context,listen: false);
                  bool exists = myList2.any((file) => file.name == _provider.getList()[_provider.getListIndex()].name);
                  iconProvider.changeMyListIcon(exists);
                },
              ),
              SizedBox(
                height: 24,
              ),
              iconRow(
                iconSymbol: Icons.file_download,
                text: 'Download Episode',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 24,
              ),
              Visibility(
                visible: data.getDislikeIcon(),
                child: iconRow(
                  iconSymbol: data.getLikeIcon() ? Icons.thumb_up_alt_outlined : Icons.thumb_up,
                  text: 'Like',
                  onTap: () {
                    data.changeLikeIcon();
                  },
                ),
              ),
              Visibility(
                visible: data.getDislikeIcon(),
                child: SizedBox(
                  height: 24,
                ),
              ),
              Visibility(
                visible: data.getLikeIcon(),
                child: iconRow(
                  iconSymbol: data.getDislikeIcon() ? Icons.thumb_down_alt_outlined : Icons.thumb_down_alt_rounded,
                  text: 'Not for me',
                  onTap: () {
                    data.changeDislikeIcon();
                  },
                ),
              ),
              Visibility(
                visible: data.getLikeIcon(),
                child: SizedBox(
                  height: 24,
                ),
              ),
              iconRow(
                iconSymbol: Icons.do_not_disturb_alt,
                text: 'Not Responding',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );

        },

      ),
    );
  }
}

class iconRow extends StatelessWidget {
  const iconRow({
    Key? key,
    required this.iconSymbol,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final IconData iconSymbol;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFF141518),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              iconSymbol,
              color: Colors.white,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
