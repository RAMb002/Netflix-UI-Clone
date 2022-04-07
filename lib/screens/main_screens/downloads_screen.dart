import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/main_screens/comingsoon_screen.dart';
import 'package:netflix_clone/screens/main_screens/more_screen.dart';
import 'package:netflix_clone/screens/main_screens/search_screen/search_screen.dart';
import 'package:netflix_clone/the_provider/bottom_nav_bar_provider.dart';
import 'package:netflix_clone/the_provider/download_screen/page_animation.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clone/widgets/bottom_navigation_container.dart';

const kBigText = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

const kSmallText = TextStyle(
  color: Colors.white54,
  fontSize: 13
);

class Downloads extends StatelessWidget {
  static const valueKey = ValueKey('DownloadScreen');

  const Downloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DownloadPage(),
        Positioned(
          child: Consumer<PageAnimation>(
            builder: (context,data,child)=>
             AnimatedSlide(
              child: DownloadePageTwo(),
              offset:!data.getPageStats()? Offset(1, 0) : Offset(0, 0),
              duration: Duration(milliseconds: 400),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadPage extends StatelessWidget {
  const DownloadPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: Stack(alignment: Alignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[850],
              radius: 70,
              child: Icon(
                Icons.file_download,
                color: Colors.black,
                size: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Text(
                'Movies and TV shows that you download appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 20),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 50,
          child: FlatButton(
              color: Colors.white,
              onPressed: () {},
              child: Text('Find Something to Download')),
        )
      ]),
    );
  }
}

class DownloadePageTwo extends StatelessWidget {
  const DownloadePageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14.0,right: 14),
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text('What is Smart Downloads?',style: kBigText,),
          SizedBox(height: 8,),
          Text("Spend less time managing downloads and more time watching. Smart Downloads gets the next "
              "episodes downloaded for you and deletes those you've already watched. Only on Wi-Fi.",style: kSmallText,),
          SizedBox(height: 30,),
          Text('How does it work?',style: kBigText,),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text("1. You finish watching an episode you've downloaded",style: kSmallText,),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text("2. The next time you're on Wi-Fi, the app automatically deletes that episode and downloads the next available one.",style: kSmallText,),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.only(left:22.0),
            child: Text("3. Once the download completes, you're already to watch.",style: kSmallText,),
          ),
          SizedBox(height: 30,),
          Text("How does it use phone space?",style: kBigText,),
          SizedBox(height: 8,),
          Text("Smart Downloads deletes an episode for every episode it downloads. It won't take up extra space beyond what you're already downloaded.",style: kSmallText,),
          SizedBox(
            height: 30,
          ),
          Text('Does Smart Downloads use my cellular data?',style: kBigText,),
          SizedBox(height: 8,),
          Text("Nope, It only works when you're connected to Wi-Fi.",style: kSmallText,)


        ],
      ),
    );

  }
}
