import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/screens/account_screen.dart';
import 'package:netflix_clone/screens/main_screens/comingsoon_screen.dart';
import 'package:netflix_clone/screens/main_screens/downloads_screen.dart';
import 'package:netflix_clone/screens/main_screens/search_screen/search_screen.dart';
import 'package:netflix_clone/the_provider/account/active_account.dart';
import 'package:netflix_clone/the_provider/account/edit_ontap.dart';
import 'package:netflix_clone/the_provider/account/names.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/loading_status.dart';
import 'package:netflix_clone/the_provider/morescreen_list.dart';
import 'package:netflix_clone/the_provider/mylist_provider.dart';
import 'package:netflix_clone/the_provider/mylist_slide.dart';
import 'package:netflix_clone/widgets/bottom_navigation_container.dart';
import 'package:netflix_clone/the_provider/bottom_nav_bar_provider.dart';
import 'package:netflix_clone/widgets/my_list.dart';
import 'package:netflix_clone/widgets/pop_up_dialog.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/data/Data.dart';


const kTextStyle = TextStyle(color: Colors.white38, fontSize: 18);

class More extends StatefulWidget {
  static const valueKey = ValueKey('MoreScreen');

  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    print('morescreen');
    final _provider = Provider.of<MoreScreenList>(
      context,
    );
    late AnimationController animationController;

    late Animation<Offset> _animation;
    if (_provider.getMoreOnTapList()) {
      animationController = AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      );
      animationController.forward();

      _animation = Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ));
    }
    // if(_provider.getslideTransitionAnimationEnd() ==1){
    //   if (animationController.status == AnimationStatus.completed) {
    //     await animationController.reverse();
    //   }
    // }

    final _screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        ListView(
          children: [
            !Provider.of<MoreScreenList>(context,).getMoreOnTapList()
                ? Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 110,
                        child: Column(
                          children: [
                            Consumer<ActiveAccount>(
                              builder: (context, active, child) {
                                final _provider = Provider.of<AccountName>(context, listen: false);
                                final _providerNav = Provider.of<BottomNavBarProvider>(context, listen: false);
                                final _providerStatus = Provider.of<LoadingStatus>(context,listen: false);
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 80,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: AnimatedContainer(
                                            height: active.getActiveName() ==
                                                    _provider.getName1()
                                                ? 80
                                                : 60,
                                            duration:
                                                Duration(milliseconds: 300),
                                            child: Profile(
                                              onTap: () async{
                                                if(active.getActiveName()!= _provider.getName1()) {
                                                  await accountStuff(
                                                      active, _provider,
                                                      _providerNav,
                                                      _providerStatus,
                                                      _provider.getName1());
                                                }
                                                else{
                                                  _providerNav.changeIndexValue(0);
                                                }
                                              },
                                              imageString:
                                                  'assets/images/professor.jpg',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: AnimatedContainer(
                                              height: active.getActiveName() ==
                                                      _provider.getName2()
                                                  ? 80
                                                  : 60,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: Profile(
                                                  onTap: ()async{
                                                    if(active.getActiveName() != _provider.getName2()) {
                                                      await accountStuff(
                                                          active, _provider,
                                                          _providerNav,
                                                          _providerStatus,
                                                          _provider.getName2());
                                                    }
                                                    else{
                                                      _providerNav.changeIndexValue(0);
                                                    }
                                                  },
                                                  imageString:
                                                      'assets/images/naruto.jpg')),
                                        ),
                                        Expanded(
                                          child: AnimatedContainer(
                                              height: active.getActiveName() ==
                                                      _provider.getName3()
                                                  ? 80
                                                  : 60,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: Profile(
                                                  onTap: ()async {
                                                    if(active.getActiveName() != _provider.getName3()) {
                                                      await accountStuff(
                                                          active, _provider,
                                                          _providerNav,
                                                          _providerStatus,
                                                          _provider.getName3());
                                                    }
                                                    else{
                                                      _providerNav.changeIndexValue(0);
                                                    }
                                                  },
                                                  imageString:
                                                      'assets/images/hopper.jpg')),
                                        ),
                                        Expanded(
                                          child: AnimatedContainer(
                                              height: active.getActiveName() ==
                                                      _provider.getName4()
                                                  ? 80
                                                  : 60,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: Profile(
                                                  onTap: ()async {
                                                    if(active.getActiveName() != _provider.getName4()) {
                                                      await accountStuff(
                                                          active, _provider,
                                                          _providerNav,
                                                          _providerStatus,
                                                          _provider.getName4());
                                                    }
                                                    else{
                                                      _providerNav.changeIndexValue(0);
                                                    }
                                                  },
                                                  imageString:
                                                      'assets/images/ram.jpg')),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 60,
                                            margin: EdgeInsets.all(3),
                                            child: Icon(
                                              Icons.add,
                                              size: 40,
                                              color: Colors.white38,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Consumer<AccountName>(
                              builder: (context, name, child) {
                                return Row(
                                  // mainAxisAlignment: ,
                                  children: [
                                    Name(name: name.getName1()),
                                    Name(name: name.getName2()),
                                    Name(
                                      name: name.getName3(),
                                    ),
                                    Name(
                                      name: name.getName4(),
                                    ),
                                    Name(
                                      name: 'Add Profile',
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        // color: Colors.red,
                        splashColor: Colors.grey,
                        onPressed: () {
                          if (Provider.of<EditOnTap>(context, listen: false).getEditOnTap() == false) {
                            Provider.of<EditOnTap>(context, listen: false).changeEditOnTap();
                          }
                          Provider.of<EditOnTap>(context, listen: false).changeMainScreenListPageTap();
                          print(Provider.of<EditOnTap>(context, listen: false).getMainScreenListPageTap());

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) {
                                return AccountScreen();
                              },
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white54,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Manage Profiles',
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // color: Color(0xFF141518),
                        child: Column(
                          children: [
                            Container(
                              // color: Colors.red,
                              // margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(10),
                              // color: Colors.grey[900],
                              width: _screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.sms,
                                        color: Colors.white54,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Tell friends about Netflix',
                                        style: TextStyle(
                                            color: Colors.white70, fontSize: 18),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Share this link so your friends can join the conversation around all your favorite TV shows and movies',
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Terms & Conditions',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 10,
                                right: 15,
                              ),
                              child: Container(
                                color: Colors.black,
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'https://www.netflix.com/ae/n/23daadf-...',
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FlatButton(
                                          color: Colors.white70,
                                          onPressed: () {},
                                          child: Text(
                                            'Copy Link',
                                            style: TextStyle(color: Colors.black),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 10, right: 10),
                              // color: Colors.red,
                              // width: _screenWidth,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Symbol(
                                        color: Colors.lightGreen.shade800,
                                        iconData: Icons.phone,
                                        iconColor: Colors.white,
                                        theName: 'Whatsapp',
                                      ),
                                      VerticalLine(
                                        color: Colors.white70,
                                        width: 01,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                              height: 40,
                                              width: 38,
                                              padding: EdgeInsets.all(7),
                                              decoration: BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(15))),
                                              child: Text(
                                                'f',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SymbolName(screenWidth: 0, name: 'Facebook')
                                        ],
                                      ),
                                      VerticalLine(
                                        color: Colors.white70,
                                        width: 01,
                                      ),
                                      Symbol(
                                        color: Colors.white,
                                        iconData: Icons.email_outlined,
                                        iconColor: Colors.red,
                                        theName: 'Gmail',
                                      ),
                                      VerticalLine(
                                        color: Colors.white70,
                                        width: 01,
                                      ),
                                      Symbol(
                                        color: Colors.black,
                                        iconData: Icons.more_horiz,
                                        iconColor: Colors.white,
                                        iconHeight: 37,
                                        theName: 'More',
                                        columnHeight: 0,

                                      ),
                                    ],
                                  ),
                                  // Container(
                                  //   // color: Colors.red,
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       SymbolName(
                                  //         screenWidth: _screenWidth,
                                  //         name: 'Whatsapp',
                                  //       ),
                                  //       SizedBox(
                                  //         width: _screenWidth * 0.07,
                                  //       ),
                                  //       SymbolName(
                                  //         screenWidth: _screenWidth,
                                  //         name: 'Facebook',
                                  //       ),
                                  //       SizedBox(
                                  //         width: _screenWidth * 0.11,
                                  //       ),
                                  //       SymbolName(
                                  //         screenWidth: _screenWidth,
                                  //         name: 'Gmail',
                                  //       ),
                                  //       SizedBox(
                                  //         width: _screenWidth * 0.10,
                                  //       ),
                                  //       SymbolName(
                                  //         screenWidth: 300,
                                  //         name: 'More',
                                  //       ),
                                  //       // SizedBox(width: _screenWidth*0.07,),
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Provider.of<MoreScreenList>(context, listen: false)
                              .changeMoreOnTapList();
                          Provider.of<EpisodeInfo>(context, listen: false)
                              .changeEpisodeIndexValue(2);
                        },
                        child: Container(
                          color: Colors.black,
                          child: Padding(
                            padding:const EdgeInsets.only(left: 14.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.check_outlined,
                                  color: Colors.white54,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'MyList',
                                  style: kTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TouchText(
                        text: 'App Settings',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TouchText(
                        text: 'Account',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TouchText(
                        text: 'Help',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TouchText(
                        text: 'Sign Out',
                        onTap: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            // isScrollControlled: true,
                            builder: (context) => PopUpDialog(
                              mainText: 'Sign out from this account ?',
                              buttonName:  'Sign Out',
                              cancelButton: true ,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                : Consumer<MyListSlideAnimation>(
                    builder: (context, slide, child) {
                      WidgetsBinding.instance?.addPostFrameCallback((_) async {
                        print('animation trigger');
                        if (slide.getslideTransitionAnimationEnd() == 1) {
                          // print(animationController.status);
                          if (animationController.status ==
                              AnimationStatus.completed) {
                            await animationController.reverse();
                          }
                          slide.changeSlideTransitionAnimationEnd(0);
                          Provider.of<MoreScreenList>(context, listen: false)
                              .changeMoreOnTapList();
                        }
                      });

                      return SlideTransition(
                        position: _animation,
                        child: MyList(screenWidth: _screenWidth, list: myList2),
                      );
                    },
                  ),
          ],
        ),
        Positioned(
          child: Consumer<LoadingStatus>(
            builder: (context, status, child) {
              return Visibility(
                visible: status.getLoadingStatus(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.8),
                ),
              );
            },
          ),
        ),
        Positioned(
          child: Consumer<LoadingStatus>(
            builder: (context,status,child){
              return Visibility(
                visible: status.getLoadingStatus(),
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> accountStuff(ActiveAccount active, AccountName _provider, BottomNavBarProvider _providerNav, LoadingStatus _providerStatus,String name) async {
    active.changeActiveName(name);
    _providerNav.clearList();
    await Future.delayed(Duration(milliseconds: 400));
    _providerStatus.changeLoadingStatus(true);
    await Future.delayed(Duration(seconds: 1));
    _providerNav
        .changeIndexValue(0);
    _providerStatus.changeLoadingStatus(false);
  }
}

class TouchText extends StatelessWidget {
  const TouchText({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.black,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                text,
                style: kTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SymbolName extends StatelessWidget {
  const SymbolName({Key? key, required double screenWidth, required this.name})
      : _screenWidth = screenWidth,
        super(key: key);

  final double _screenWidth;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: _screenWidth * 0.18,
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white60,
        ),
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    Key? key,
    required this.color,
    required this.width,
  }) : super(key: key);
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 70,
      child: VerticalDivider(
        color: color,
        width: 10,
      ),
    );
  }
}

class Symbol extends StatelessWidget {
  const Symbol({
    Key? key,
    required this.color,
    required this.iconData,
    required this.iconColor,
    this.iconHeight = 25,
    required this.theName,
     this.columnHeight = 10,
  }) : super(key: key);

  final Color color;
  final IconData iconData;
  final Color iconColor;
  final double iconHeight;
  final String theName;
  final double columnHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Icon(
            iconData,
            size: iconHeight,
            color: iconColor,
          ),
        ),
        SizedBox(height: columnHeight,),
        SymbolName(
          screenWidth: MediaQuery.of(context).size.width,
          name: theName,
        ),
      ],
    );
  }
}

class Name extends StatelessWidget {
  const Name({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 80,
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white30,
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.imageString, required this.onTap})
      : super(key: key);
  final String imageString;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(3),
        // height: 60,
        // width: 50,
        decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
                image: AssetImage(imageString), fit: BoxFit.cover)),
      ),
    );
  }
}
