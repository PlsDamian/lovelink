import 'package:flutter/material.dart';
import 'package:lovelink/views/access/Login.dart';
import 'package:lovelink/views/main_pages/matches.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  Future<bool> isActiveSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString('user') ?? '';
    String password = prefs.getString('password') ?? '';

    // Simulate delay for demonstration purposes
    await Future.delayed(const Duration(seconds: 4));


    return user.isNotEmpty && password.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    checkSession();
  }

  void checkSession() async {
    bool sessionActive = await isActiveSession();
    if (sessionActive) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const Matches(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.white60,
            ),
          ],
        ),
      ),
    );
  }
}
