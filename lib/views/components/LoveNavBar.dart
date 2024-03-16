import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lovelink/views/main_pages/config/Config.dart';
import '../main_pages/matches.dart';
import '../main_pages/profile.dart';


class LoveNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChange;

  const LoveNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.black,
          tabBackgroundColor: const Color(0xffffa31a),
          gap: 8,
          selectedIndex: currentIndex,
          onTabChange: (index) {
            // Update the currentIndex in the parent widget
            onTabChange(index);
            // Navigate to the corresponding file based on the selected index
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Profile(),
                  ),
                );
                break;
              case 1:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Matches(),
                  ),
                );
                break;
              case 2:
                break;
              case 3:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Config(),
                  ),
                );
                break;
            }
          },
          padding: const EdgeInsets.all(10),
          tabs: const [
            GButton(icon: Icons.person, text: 'Profile'),
            GButton(icon: Icons.favorite, text: 'Matches'),
            GButton(icon: Icons.chat_bubble, text: 'Chat'),
            GButton(icon: Icons.settings, text: 'Settings'),
          ],
        ),
      ),
    );
  }
}
