import 'package:flutter/material.dart';
import 'package:lovelink/views/components/LoveButton.dart';
import 'package:lovelink/views/components/LoveTextField.dart';
import 'package:lovelink/views/components/Sizer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const LoveTextField(
            Placeholder: "Name",
            Wsize: 250,
            icono: Icon(Icons.person),
          ),
          const SizedBox(
            height: 10,
          ),
          const LoveTextField(
            Placeholder: "Email",
            Wsize: 250,
            icono: Icon(Icons.email),
          ),
          const SizedBox(
            height: 10,
          ),
          const LoveTextField(
            Placeholder: "Phone",
            Wsize: 250,
            icono: Icon(Icons.phone),
          ),
          const SizedBox(
            height: 10,
          ),
          const LoveTextField(
            Placeholder: "Password",
            Wsize: 250,
            icono: Icon(Icons.lock),
          ),
          const SizedBox(
            height: 10,
          ),
          const LoveTextField(
            Placeholder: "Confirm Password",
            Wsize: 250,
            icono: Icon(Icons.lock),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Accept Terms and Conditions",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  border: Border.all(color: Colors.black),
                ),
              )
            ],
          ),
          const Spacer(),
          LoveButton(texto: "Register", Wsize: getTextFieldSize(context)),
          const Spacer(),
        ],
      ),
    );
  }
}
