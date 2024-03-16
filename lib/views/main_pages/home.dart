import 'package:flutter/material.dart';
import 'package:lovelink/views/main_pages/config/config.dart';
import 'package:lovelink/views/main_pages/profile.dart';
import 'package:lovelink/views/main_pages/matches.dart';
import 'package:lovelink/views/components/LoveNavBar.dart';
import 'package:lovelink/constants.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Widget> _screens = [
    const Center(child: Text('Home')),
    const Matches(),
    Profile(),
    const Config(),
  ];

  int _currentIndex = 0; // Initialize currentIndex

  void tabNavigation(int index) {
    setState(() {
      _currentIndex = index; // Update currentIndex
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: background),
          _screens[_currentIndex],
        ],
      ),
      bottomNavigationBar: LoveNavBar(
        currentIndex: _currentIndex,
        onTabChange: tabNavigation,
      ),
    );
  }
}
