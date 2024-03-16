import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lovelink/views/components/LoveNavBar.dart';

class Config extends StatefulWidget {
  const Config({Key? key}) : super(key: key);

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  Future<void> closeSession() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final SharedPreferences prefs =
                await SharedPreferences.getInstance();
                await prefs.remove('user');
                await prefs.remove('password');
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Config'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: closeSession,
          child: Text('Log out'),
        ),
      ),
      bottomNavigationBar: LoveNavBar(
        currentIndex: 3,
        onTabChange: (index) {
        },
      ),
    );
  }
}
