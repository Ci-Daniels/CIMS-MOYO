import 'package:cimstestone/home%20page.dart';
import 'package:cimstestone/profile.dart';
import 'package:flutter/material.dart';
//import 'graph.dart';
import 'history.dart';

void main() => runApp(CimsApp());

/// This Widget is the main application widget.
class CimsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 173, 105, 128),
          body: dashBar()),
    );
  }
}

class dashBar extends StatefulWidget {
  //MyNavigationBar ({Key key}) : super(key: key);

  @override
  _dashBarState createState() => _dashBarState();
}

class _dashBarState extends State<dashBar> {
  int _selectedIndex = 0;
  //to navigate to the given pages

  List<Widget> pageList = <Widget>[
    const ParticleApp(),
    historypage(),
    //graphPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //to go back to the previous question
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        // child: _widgetOptions.elementAt(_selectedIndex),
        child: pageList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'History',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.black,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 218, 139, 214),
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
