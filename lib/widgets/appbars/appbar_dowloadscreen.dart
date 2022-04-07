import 'package:flutter/material.dart';
import 'package:netflix_clone/the_provider/download_screen/page_animation.dart';
import 'package:netflix_clone/the_provider/download_screen/the_switch.dart';
import 'package:provider/provider.dart';

class AppBarDownloadScreen extends StatelessWidget {



  bool button = false;

  @override
  Widget build(BuildContext context) {
    print('app bar download screen build');
    return SafeArea(
        child: !Provider.of<PageAnimation>(context,).getPageStats()
            ? GestureDetector(
                onTap: () {
                  Provider.of<PageAnimation>(context,listen: false).changePageStats(true);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  color: Colors.black,
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Smart Downloads',
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(
                        width: 3,
                      ),

                      Consumer<TheSwitch>(
                        builder: (context,button,child)=>
                            button.getSwitch()? Container(
                                color: Colors.black,
                                child: Text(
                                  'ON',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )  : Container(
                              color: Colors.black,
                              child: Text(
                                'OFF',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),

                    ],
                  ),
                ),
              )
            : Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Provider.of<PageAnimation>(context,listen: false).changePageStats(false);

                        },
                      ),
                    ),
                    Text(
                      'Smart Downloads',
                      style: TextStyle(color: Colors.white, fontSize: 20,letterSpacing: 0.9,fontWeight: FontWeight.w300),
                    ),
                    Consumer<TheSwitch>(
                      builder: (context,data,child){
                        return Switch(
                          value: data.getSwitch(),
                          onChanged: (onChanged) {
                            data.changeSwitch(onChanged);
                          },
                          inactiveTrackColor:  Colors.grey.shade900,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.blue.shade700,
                        );
                      },


                    ),
                  ],
                ),
            ));
  }
}
