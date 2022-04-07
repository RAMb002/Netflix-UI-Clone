import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/the_provider/genre_selection.dart';
import 'package:provider/provider.dart';

class AllGenres extends StatelessWidget {
  const AllGenres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _list = [
      'All Genres',
      'Holidays',
      'Indian',
      'US',
      'British',
      'European',
      'Asian',
      'Family',
      'Action',
      'Dramas',
      'Comedies',
      'Crime',
      'Kids',
      'Docuseries',
      'Romance',
      'Thriller',
      'Horror',
      'Teen',
      'Anime',
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              bottom: 0,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    gradient: LinearGradient(
                      stops: [0, 1],
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
              )),
          ListView.builder(
              itemCount: _list.length,
              itemBuilder: (BuildContext context, index) {
                return Consumer<GenreSelection>(
                  builder: (context, data, child) {
                    return Column(
                      children: [
                        index == 0
                            ? SizedBox(
                                height: 100,
                              )
                            : Container(),
                        GestureDetector(
                          child: Text(
                            _list[index],
                            style: TextStyle(
                              fontSize: _list[index] == data.getCurrentGenre()
                                  ? 24
                                  : 18,
                              color: _list[index] == data.getCurrentGenre()
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                          onTap: () {
                            data.changeCurrentGenre(_list[index]);
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        index == _list.length - 1
                            ? Container(
                                height: 100,
                              )
                            : Container(),
                      ],
                    );
                  },
                );
              }),
          Positioned(
              bottom: 0,
              child: IgnorePointer(
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      gradient: LinearGradient(
                    stops: [0, 1],
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
                ),
              )),
          Positioned(
            bottom: 20,
            child: FlatButton(
              height: 65,
              color: Colors.white,
              onPressed: (){
                Navigator.pop(context);
              },
              shape: CircleBorder(),
              child: Icon(
                Icons.clear,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
