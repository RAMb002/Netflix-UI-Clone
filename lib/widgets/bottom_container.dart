import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/data/content_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/the_provider/episodes/navigation.dart';
import 'package:provider/provider.dart';

class BottomContainer extends StatelessWidget {
  final List<Content> list;
  final int index;
  final Function() onTap;
  const BottomContainer({Key? key, required this.list, required this.index,required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _statusBarHeight = MediaQuery.of(context).padding.top;
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height - _statusBarHeight;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFF141518),
        padding: EdgeInsets.all(10),
        height: 272,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 140,
                  width: _screenWidth * 0.27,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage(list[index].imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 140,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // width: _screenWidth * 0.48,
                              child: AutoSizeText(
                                list[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w700
                                ),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              width: _screenWidth * 0.01,
                            ),
                            GestureDetector(
                              onTap: (){
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
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '2014  18+ 1season',
                          style: TextStyle(color: Colors.white38, fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: Text(
                            list[index].description,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex : 2,
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Play',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(child: IconColumn(
                  text: 'Download',
                  iconData: Icons.file_download,
                ),),
                Expanded(child: IconColumn(
                  text: 'Preview',
                  iconData: Icons.play_arrow_outlined,
                ))
              ],
            ),
            Divider(
              color: Colors.white12,
            ),
            ListTile(
              // onTap: (){print('hi');},
              contentPadding: EdgeInsets.all(0),
              dense: true,
              title: Text(
                'Episodes & Info',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
              leading:  Icon(Icons.info_outline_rounded,
                color: Colors.white,
                size: 30,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: Colors.white,
                size: 30,
              ),
            )

          ],
        ),
      ),
    );
  }
}

class IconColumn extends StatelessWidget {

  final String text;
  final IconData iconData;
  const IconColumn({
    Key? key,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.white,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white38,
              fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}
// Navigator.pop(context);
// final _provider =Provider.of<EpisodeListIndex>(context,listen: false);
// final _provider2 = Provider.of<EpisodeNavigation>(context,listen: false);
// _provider2.changeNavigationIndex(0);
// Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeIndexValue(1);
// Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeInfoDataToTrue();
// _provider.changeIndex(index);
// _provider.changeList(list);
// if(_provider.getList()[_provider.getListIndex()].text=='movie'){
//   _provider2.changeNavigationIndex(2);
// }