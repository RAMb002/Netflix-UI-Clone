import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/logo_screen.dart';
import 'package:netflix_clone/screens/main_screens/comingsoon_screen.dart';
import 'package:netflix_clone/screens/main_screens/downloads_screen.dart';
import 'package:netflix_clone/screens/main_screens/home_screen.dart';
import 'package:netflix_clone/screens/main_screens/more_screen.dart';
import 'package:netflix_clone/screens/main_screens/search_screen/search_screen.dart';
import 'package:netflix_clone/the_provider/account/active_account.dart';
import 'package:netflix_clone/the_provider/account/edit_ontap.dart';
import 'package:netflix_clone/the_provider/account/names.dart';
import 'package:netflix_clone/the_provider/bottom_container_menu_iconchanges.dart';
import 'package:netflix_clone/the_provider/bottom_nav_bar_provider.dart';
import 'package:netflix_clone/the_provider/comingsoon_screen/my_list.dart';
import 'package:netflix_clone/the_provider/download_screen/page_animation.dart';
import 'package:netflix_clone/the_provider/episodes/episode_app_bar_data.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/the_provider/episodes/icon.dart';
import 'package:netflix_clone/the_provider/episodes/navigation.dart';
import 'package:netflix_clone/the_provider/episodes/ontap_list.dart';
import 'package:netflix_clone/the_provider/episodes/slide_animation.dart';
import 'package:netflix_clone/the_provider/genre_selection.dart';
import 'package:netflix_clone/the_provider/main_section/listTap.dart';
import 'package:netflix_clone/the_provider/search_screen_text/epi_index.dart';
import 'package:netflix_clone/the_provider/search_screen_text/epi_like.dart';
import 'package:netflix_clone/the_provider/search_screen_text/epi_list.dart';
import 'package:netflix_clone/the_provider/search_screen_text/foucs.dart';
import 'package:netflix_clone/the_provider/loading_status.dart';
import 'package:netflix_clone/the_provider/morescreen_list.dart';
import 'package:netflix_clone/the_provider/mylist_provider.dart';
import 'package:netflix_clone/the_provider/mylist_slide.dart';
import 'package:netflix_clone/the_provider/nested_scroll_controller.dart';
import 'package:netflix_clone/the_provider/search_screen_text/list_stacks.dart';
import 'package:netflix_clone/the_provider/search_screen_text/scroll.dart';
import 'package:netflix_clone/the_provider/search_screen_text/search_finish.dart';
import 'package:netflix_clone/the_provider/search_screen_text/the_text.dart';
import 'package:netflix_clone/the_provider/download_screen/the_switch.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/the_provider/backend.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/the_provider/bottom_nav_bar_provider.dart';
import 'package:netflix_clone/the_provider/search_screen_text/foucs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Backend(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextFocus(),
        ),
        ChangeNotifierProvider(
          create: (context) => EpisodeInfo(),
        ),
        ChangeNotifierProvider(
          create: (context) => EpisodeAppBarData(),
        ),
        ChangeNotifierProvider(
          create: (context) => EpisodeListIndex(),
        ),
        ChangeNotifierProvider(
          create: (context) => EpisodeNavigation(),
        ),
        ChangeNotifierProvider(
          create: (context) => IconChange(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomContainerMenuIconChanges(),
        ),
        ChangeNotifierProvider(
          create: (context) => OnTapListValues(),
        ),
        ChangeNotifierProvider(
          create: (context) => NestedScrollController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SlideAnimation(),
        ),
        ChangeNotifierProvider(
          create: (context) => MoreScreenList(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyListSlideAnimation(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditOnTap(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountName(),
        ),
        ChangeNotifierProvider(
          create: (context) => ActiveAccount(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoadingStatus(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextFieldText(),
        ),
        ChangeNotifierProvider(
          create: (context) => ListTap(),
        ),
        ChangeNotifierProvider(
          create: (context) =>MyList(),
        ),
        ChangeNotifierProvider(
          create: (context) =>GenreSelection(),
        ),
        ChangeNotifierProvider(
          create: (context) =>ListStacks(),
        ),
        ChangeNotifierProvider(
          create: (context) =>Scroll(),
        ),
        ChangeNotifierProvider(
          create: (context) => EpiIndex(),
        ),
        ChangeNotifierProvider(
          create: (context) => EpiLike(),
        ),
        ChangeNotifierProvider(
          create: (context) => EpiList(),
        ),
        ChangeNotifierProvider(
          create: (context) => TheSwitch(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageAnimation(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchFinish(),
        ),

      ],
      child: MaterialApp(
        title: 'Netflix Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primarySwatch: MaterialColor(0xFF424242,{1}),
          primaryTextTheme: TextTheme(caption: TextStyle(color: Colors.red, fontSize: 17)),
          scaffoldBackgroundColor: Colors.black,

        ),
        home: LogoScreen(),
      ),
    );
  }
}
