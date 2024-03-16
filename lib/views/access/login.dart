import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lovelink/views/access/register.dart';
import 'package:lovelink/views/components/LoveButton.dart';
import 'package:lovelink/views/components/LoveTextField.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/Sizer.dart';
import '../main_pages/matches.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  void valuePrint() {
    if (kDebugMode) {
      print("Usuario: ${userController.text}");
    }
    if (kDebugMode) {
      print("Password: ${passwordController.text}");
    }
  }

  void showAlert(String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // Corrected the missing parenthesis here
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        } // Also add any missing semicolons if applicable
        );
  }

  void makeLogin() async {
    if (userController.text.isEmpty) {
      showAlert("Enter an email");
      return;
    }

    if (!EmailValidator.validate(userController.text)) {
      showAlert("Enter valid email");
      return;
    }

    if (passwordController.text.isEmpty) {
      showAlert("Enter a password");
      return;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', userController.text);
    await prefs.setString('password', passwordController.text);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Matches(),
      ),
    );

  }

  void goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Register(),
      ),
    );
  }

  void goToMatches() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Matches(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: const Color(0xFF2F2F2F),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              const Spacer(),
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              const Spacer(),
              LoveTextField(
                Placeholder: "Email",
                Wsize: getTextFieldSize(context),
                icono: const Icon(Icons.email),
                controller: userController,
              ),
              const SizedBox(
                height: 15,
              ),
              LoveTextField(
                Placeholder: "Password",
                isObscured: true,
                Wsize: getTextFieldSize(context),
                icono: const Icon(Icons.lock),
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.125,
                  )
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              GestureDetector(
                onTap: makeLogin,
                child: LoveButton(
                  texto: 'Sign in',
                  Wsize: getTextFieldSize(context),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: goToRegister,
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: goToMatches,
                child: const Text(
                  "Matches",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
