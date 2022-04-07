import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/the_provider/main_section/listTap.dart';
import 'package:netflix_clone/widgets/continue_list.dart';
import 'package:netflix_clone/widgets/main_section.dart';
import 'package:provider/provider.dart';



class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.activeName,
    // required ScrollController scrollController,

  }) :
        // _scrollController = scrollController,
        super(key: key);
final String activeName;
  // final ScrollController _scrollController;


  @override
  Widget build(BuildContext context) {
    return ListView(
      // controller: _scrollController,
      children: [
        MainSection(
          content: sintelContent,
        ),
        ContinueList(
          bigSize: false,
          list: previews,
          playAndIconButtonVisibility: true,
          text: 'Continue Watching for $activeName',

        ),
        Consumer<ListTap>(
          builder: (context,tap,child){
            return ContinueList(
              bigSize: false,
              list: myList2.reversed.toList(),
              playAndIconButtonVisibility: false,
              text: 'My List',

            );
    },

        ),
        ContinueList(
          list: originals.reversed.toList(),
          bigSize: false,
          playAndIconButtonVisibility: false,
          text: 'Watch It Again',
        ),
        ContinueList(
          list: trending.reversed.toList(),
          bigSize: false,
          playAndIconButtonVisibility: false,
          text: 'Popular of Netflix',

        ),
        ContinueList(
          list: originals,
          bigSize: true,
          playAndIconButtonVisibility: false,
          text: 'Only on Netflix',
        ),


        ContinueList(
          list: trending,
          bigSize: false,
          playAndIconButtonVisibility: false,
          text: 'Trending Now',

        ),
        ContinueList(
          list: anime,
          bigSize: false,
          playAndIconButtonVisibility: false,
          text: 'Anime',

        ),
      ],
    );
  }
}
