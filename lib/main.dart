import 'package:flutter/material.dart';

void main() {
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
    const Text(
      'Home',
    ),
    const Text(
      'Search',
    ),
    const Text(
      'Post',
    ),
    const Text(
      'Activity',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('images/camera.png', height: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Image.asset(
                      'images/title.png',
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                  ),
                ],
              ),
              Image.asset('images/message.png', height: 35),
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
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/post.png')),
              activeIcon: ImageIcon(AssetImage('images/post_active.png')),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/heart.png')),
              activeIcon: ImageIcon(AssetImage('images/heart_active.png')),
              label: 'Activity',
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
