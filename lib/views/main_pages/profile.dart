import 'package:flutter/material.dart';
import 'package:lovelink/views/components/LoveTextField.dart';
import 'package:lovelink/views/components/LoveNavBar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String name = "Michelle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xff232323),
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffffa31a),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/cat.jpg'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                        },
                        child: const Text(
                          'Guardar',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        name,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Perfil',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LoveTextField(
                        Placeholder: 'Email',
                        Wsize: double.infinity,
                        icono: Icon(Icons.email, color: Colors.white),
                        textColor: Colors.white,
                      ),
                      LoveTextField(
                        Placeholder: 'Teléfono',
                        Wsize: double.infinity,
                        icono: Icon(Icons.phone, color: Colors.white),
                        textColor: Colors.white,
                      ),
                      LoveTextField(
                        Placeholder: 'Facebook',
                        Wsize: double.infinity,
                        icono: Icon(Icons.facebook, color: Colors.white),
                        textColor: Colors.white,
                      ),
                      LoveTextField(
                        Placeholder: 'Instagram',
                        Wsize: double.infinity,
                        icono: Icon(Icons.center_focus_strong, color: Colors.white),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: LoveNavBar(
        currentIndex: 0,
        onTabChange: (index) {
        },
      ),
    );
  }
}
