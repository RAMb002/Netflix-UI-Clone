// import 'dart:html';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:netflix_clone/data/Data.dart';
import 'package:netflix_clone/data/content_model.dart';
import 'package:netflix_clone/the_provider/episodes/episode_app_bar_data.dart';
import 'package:netflix_clone/the_provider/episodes/episode_info.dart';
import 'package:netflix_clone/the_provider/episodes/episode_list_index.dart';
import 'package:netflix_clone/the_provider/episodes/icon.dart';
import 'package:netflix_clone/the_provider/episodes/navigation.dart';
import 'package:netflix_clone/the_provider/main_section/listTap.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/data/Data.dart';

class MainSection extends StatelessWidget {
  final List<Content> content;
  const MainSection({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 425,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(content[0].imageUrl), fit: BoxFit.cover)),
        ),
        Container(
          height: 428,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.07, 1],
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 120.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(content[0].titleImageUrl),
          ),
        ),
        Positioned(
          bottom: 80,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 25,
            child: FittedBox(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Suspenseful  ',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  TextSpan(
                      text: '•',
                      style: TextStyle(
                        color: Colors.red,
                      )),
                  TextSpan(
                      text: '  Action & Adventure  ',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  TextSpan(
                      text: '•',
                      style: TextStyle(
                        color:  Colors.red,
                      )),
                  TextSpan(
                      text: '  Drama  ',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  TextSpan(
                      text: '•',
                      style: TextStyle(
                        color:  Colors.red,
                      )),
                  TextSpan(
                      text: '  Ensemble  ',
                      style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: '•',
                      style: TextStyle(
                        color:  Colors.red,
                      )),
                  TextSpan(
                      text: '  Combat  ',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ]),
              ),
            ),
          ),
        ),


        Positioned(
          bottom: 0,
          child: Row(
            children: [
              Consumer<ListTap>(
                builder: (context,tap,child){
                  return Button(
                    onPressed: (){
                      tap.changeListTap();
                      if(tap.getListTap()){
                        bool exists = myList2.any((file) => file.name == content[0].name);
                        if(!exists){
                          content[0].myListCheck=true;
                          myList2.add(content[0]);
                          tap.changeBaka();
                        }

                      }
                      if(!tap.getListTap()){
                        for(int i=0;i<myList2.length+10;i++){
                          try{

                            if(myList2[i].name==content[0].name && myList2.length >4){
                              // print(myList2.length);
                              content[0].myListCheck = false;
                              myList2.removeAt(i);
                              tap.changeBaka();
                              break;

                            }}catch(e){
                          }
                        }
                      }
                    },
                    iconData: content[0].myListCheck==false ?Icons.add : Icons.check,
                    text: ' My List',
                  );
                },
              ),
              SizedBox(
                width: 50,
              ),
              FlatButton(
                height: 40,
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.play_arrow,color: Colors.black,size: 28,),
                    SizedBox(width: 10,),
                    Text('Play',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)

                  ],
                ),
                onPressed: (){},
              ),SizedBox(
                width: 50,
              ),
              Button(onPressed :(){
                final _provider =Provider.of<EpisodeListIndex>(context,listen: false);
                final _provider2 = Provider.of<EpisodeNavigation>(context,listen: false);
                _provider2.changeNavigationIndex(0);
                Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeIndexValue(1);
                Provider.of<EpisodeInfo>(context,listen: false).changeEpisodeInfoDataToTrue();
                _provider.changeIndex(0);
                _provider.changeList(content);
                if(_provider.getList()[_provider.getListIndex()].text=='movie'){
                  _provider2.changeNavigationIndex(2);
                }
                Provider.of<EpisodeAppBarData>(context,listen: false).changeOffsetValueToZero();
                final iconProvider =Provider.of<IconChange>(context,listen: false);
                bool exists = myList2.any((file) => file.name == _provider.getList()[_provider.getListIndex()].name);
                iconProvider.changeMyListIcon(exists);
              },text: 'Info', iconData: Icons.info_outlined)

            ],
          ),
        )
      ],
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function() onPressed;
  const Button({
    Key? key,
    required this.text,
    required this.iconData,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 8.0),
      child: Column(
        children: [
          IconButton(onPressed: onPressed, icon: Icon(
            iconData,
            size: 35,
            color: Colors.white,
          ),),
          Text(text,style : TextStyle(color: Colors.white70,fontSize: 10),)
        ],
      ),
    );
  }
}
