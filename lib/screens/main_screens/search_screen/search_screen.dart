import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:netflix_clone/data/content_model.dart';
import 'package:netflix_clone/screens/episode_beta.dart';
import 'package:netflix_clone/screens/main_screens/comingsoon_screen.dart';
import 'package:netflix_clone/screens/main_screens/downloads_screen.dart';
import 'package:netflix_clone/screens/main_screens/more_screen.dart';
import 'package:netflix_clone/screens/ontap_nav_text.dart';
import 'package:netflix_clone/the_provider/search_screen_text/foucs.dart';
import 'package:netflix_clone/the_provider/search_screen_text/list_stacks.dart';
import 'package:netflix_clone/the_provider/search_screen_text/scroll.dart';
import 'package:netflix_clone/the_provider/search_screen_text/the_text.dart';
import 'package:netflix_clone/widgets/bottom_navigation_container.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/the_provider/bottom_nav_bar_provider.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/screens/main_screens/search_screen/search_widget.dart';
import 'package:netflix_clone/data/Data.dart';

class SearchScreen extends StatefulWidget {
  // static const valueKey = ValueKey('SearchScreen');
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    // print(Provider.of<ListStacks>(context,listen: false).getWidgetList());
    print('screenbuild');
    // print( Provider.of<ListStacks>(context,).getWidgetList());

    final _provider =Provider.of<ListStacks>(context,);
// print(_provider.getWidgetList().length-1);
// print(_provider.getPageController());
    return PageView.builder(
      itemCount: _provider.getWidgetList().length,
      physics: NeverScrollableScrollPhysics(),
      controller: _provider.getPageController(),
        itemBuilder: (BuildContext,index){

        // print(_provider.getWidgetList());
      return _provider.getWidgetList()[index];
    });

  }


}
