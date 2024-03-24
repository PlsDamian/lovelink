import 'package:flutter/material.dart';
import 'package:lovelink/views/main_pages/config/Config.dart';
import 'package:lovelink/views/main_pages/home.dart';
import 'package:lovelink/views/main_pages/matches.dart';
import 'package:lovelink/views/main_pages/profile.dart';

class LoveNavBar extends StatefulWidget {
  const LoveNavBar({Key? key}) : super(key: key);

  @override
  _LoveNavBarState createState() => _LoveNavBarState();
}

class _LoveNavBarState extends State<LoveNavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Home(),
    const Matches(),
    Profile(),
    const Config(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
