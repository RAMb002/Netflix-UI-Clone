import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeasonScreen extends StatelessWidget {
  const SeasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children : [
        Center(
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Text('Season 1',style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),),
          ),
        ),
        ]
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            splashColor: Colors.grey[100],
            onPressed: () {
              // print(_provider.myListGenreVisibility());
              // print(_provider2.onTapMyListValue());
              Navigator.pop(context);

            },
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),    );
  }
}
