import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:ui';
import 'package:readmore/readmore.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Empower Application';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExplorePage(),
    const Text(
      'Post',
    ),
    const Text(
      'Event',
    ),
    const Text(
      'Profile',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('images/banner.png', height: 55),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/home.png')),
              activeIcon: ImageIcon(AssetImage('images/home_active.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/search.png')),
              activeIcon: ImageIcon(AssetImage('images/search_active.png')),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/post.png')),
              activeIcon: ImageIcon(AssetImage('images/post_active.png')),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/event.png')),
              activeIcon: ImageIcon(AssetImage('images/event_active.png')),
              label: 'Event',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('images/profilepicture.png'),
              ),
              activeIcon: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('images/profilepicture.png'),
                  ),
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black87,
          iconSize: 35.0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

Widget HomePage() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Post(1, 'fernandatan', '1d',
            'Took part in Shopee Product and Design Challenge 2021 as part of Team Ah Ballin and ended off our journey as Semi-Finalist! it was an enriching experience and we will like to extend our gratitude to our mentor Vivian for her help and guidance along the way.'),
        Post(2, 'nigelng', '1d',
            "Today marks the final day of my internship with UBS in its headquarters, Zurich, Switzerland. It has been an eventful journey thus far, journeying to a foreign country and collaborating with like-minded individuals. It has not been an easy adventure with steep learning curves and challenging projects. Nevertheless, I have only great things to say about my journey with my amazing team. I would like to thank George, Floyd, Lina, Steve and Ayden for your continuous support for my growth and patience for my learning. I will thoroughly miss working with all of you and I hope that our paths will cross again some time in the near future. "),
      ],
    ),
  );
}

Widget Post(numOfUser, name, date, postText) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('images/other_profile_$numOfUser.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily:
                            Platform.isAndroid ? 'Roboto' : 'Neue Helvetica',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(date,
                        style: TextStyle(
                          fontFamily:
                              Platform.isAndroid ? 'Roboto' : 'Neue Helvetica',
                        )),
                  ],
                )
              ],
            ),
            Image.asset(
              'images/more.png',
              width: 40,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
          child: Container(
              width: window.physicalSize.width,
              child: ReadMoreText(
                postText,
                trimLines: 2,
                colorClickableText: Colors.grey,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                moreStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              )
            ),
        ),
        Image.asset('images/post_' + numOfUser.toString() + '.png'),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 10.0, bottom: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/heart.png', width: 30),
              RichText(
                  text: const TextSpan(
                      text: "Like (10)",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16))),
              // Container(height: 40, child: const VerticalDivider(color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset('images/comment.png', width: 30),
              ),
              RichText(
                  text: const TextSpan(
                      text: "Comment (5)",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16))),
              // Container(height: 40, child: const VerticalDivider(color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset('images/message.png', width: 30),
              ),
              RichText(
                  text: const TextSpan(
                      text: "Share (5)",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16))),
            ],
          ),
        ),
        Container(
            height: 15,
            child: const Divider(color: Color(0xFFEEEEEE), thickness: 5)),
      ],
    ),
  );
}

Widget ExplorePage() {
  return const Text("Add in Explore Page stuff here");
}
