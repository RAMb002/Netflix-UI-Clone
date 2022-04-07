import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/edit_profile.dart';
import 'package:netflix_clone/screens/main_screens/home_screen.dart';
import 'package:netflix_clone/the_provider/account/active_account.dart';
import 'package:netflix_clone/the_provider/account/edit_ontap.dart';
import 'package:netflix_clone/the_provider/account/names.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('account build');
    final _provider = Provider.of<EditOnTap>(
      context,
    );
    final _providerNoListen = Provider.of<EditOnTap>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        if (!_provider.getMainScreenListPageTap() && _providerNoListen.getEditOnTap()) {
          _providerNoListen.changeEditOnTap();
          // print('bye');
          return false;
        }
        if(_provider.getMainScreenListPageTap()){

          // _provider.changeEditOnTap();
          _provider.changeMainScreenListPageTap();
          return true;

        }

        return true;
      },
      child: Scaffold(
        appBar: !_provider.getEditOnTap()
            ? PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 60),
                child: SafeArea(
                  child: Container(
                    height: 60,
                    // color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              )),
                          Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                              image:
                                  AssetImage('assets/images/netflix_logo1.png'),
                              fit: BoxFit.cover,
                            )),
                          ),
                          IconButton(
                              onPressed: () {
                                  Provider.of<EditOnTap>(context, listen: false).changeEditOnTap();

                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ))
            : AppBar(
                backgroundColor: Colors.black,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () async{
                    final _provider = Provider.of<EditOnTap>(context,listen: false);
                    if(_provider.getMainScreenListPageTap()){
                      print('hi');

                      Navigator.pop(context);
                      await Future.delayed(Duration(milliseconds: 500));
                      _provider.changeEditOnTap();
                      _provider.changeMainScreenListPageTap();
                    }
                    else {
                      Provider.of<EditOnTap>(context, listen: false)
                          .changeEditOnTap();
                    }
                  },
                ),
                title: Text(
                  '  Manage Profiles',
                  style: TextStyle(color: Colors.white, fontSize: 20,letterSpacing: 1,fontWeight: FontWeight.w400),
                ),
              ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  !_provider.getEditOnTap() ? Text(
                    "Who's Watching?",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ) : Text(''),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Consumer<AccountName>(
                      builder: (context,name,child){
                        return   Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LogoName(
                                  imagePath: 'assets/images/professor.jpg',
                                  Name: name.getName1(),
                                  provider: _provider,
                                  identity: 'name1',
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                LogoName(
                                  Name: name.getName2(),
                                  imagePath: 'assets/images/naruto.jpg',
                                  provider: _provider,
                                  identity: 'name2',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LogoName(
                                  imagePath: 'assets/images/hopper.jpg',
                                  Name: name.getName3(),
                                  provider: _provider,
                                  identity: 'name3',
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                LogoName(
                                  Name: name.getName4(),
                                  imagePath: 'assets/images/ram.jpg',
                                  provider: _provider,
                                  identity: 'name4',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30,
                                      child: Icon(
                                        Icons.add,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Add Profile',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  height: 110,
                                  width: 120,
                                )
                              ],
                            )
                          ],
                        );
                      },

                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LogoName extends StatelessWidget {
  const LogoName(
      {Key? key,
      required this.Name,
      required this.imagePath,
      required this.provider,
        required this.identity,
      })
      : super(key: key);

  final String imagePath;
  final String Name;
  final EditOnTap provider;
  final String identity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<ActiveAccount>(context,listen: false).changeActiveName(Name);
            Navigator.pushReplacement<void, void>(
              context,
              CupertinoPageRoute<void>(
                builder: (BuildContext context) => HomeScreen(activeName:  Provider.of<ActiveAccount>(context,).getActiveName(),),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 95,
                width: 105,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.cover)),
              ),
              Positioned(
                  child: Visibility(
                visible: provider.getEditOnTap(),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return EditProfile(imagePath: imagePath, name: Name,identity: identity,);
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 110,
                    width: 120,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              )),
              Positioned(
                  child: Visibility(
                visible: provider.getEditOnTap(),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return EditProfile(imagePath: imagePath, name: Name,identity: identity,);
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 100,
          child: Text(
            Name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        )
      ],
    );
  }
}
