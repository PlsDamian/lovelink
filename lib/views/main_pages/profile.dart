import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lovelink/constants.dart';
import 'package:lovelink/models/user.dart';
import 'package:lovelink/views/components/LoveTextField.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late User userdata;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  XFile? _selectedPhoto;

  @override
  void initState(){
    super.initState();
    userdata = User(name: 'Daniela', email: '', phone: '6633331234');

    emailController.text = userdata.email;
    phoneController.text = userdata.phone;

  }

  Future<void> changeProfilePicture() async{
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedPhoto = image;
    });

    //final XFile? photo = await picker.pickImage(source: ImageSource.camera);

  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xffffa31a),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: background,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xffffa31a),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/cat.jpg'),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Guardar',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            userdata.name,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LoveTextField(
                              Placeholder: 'Email',
                              Wsize: double.infinity,
                              icono: const Icon(Icons.email, color: Colors.white),
                              textColor: Colors.white,
                              controller: emailController,
                            ),
                            const SizedBox(height: 20),
                            LoveTextField(
                              Placeholder: 'Teléfono',
                              Wsize: double.infinity,
                              icono: const Icon(Icons.phone, color: Colors.white),
                              textColor: Colors.white,
                              controller: phoneController,
                            ),
                            const SizedBox(height: 20),
                            const LoveTextField(
                              Placeholder: 'Facebook',
                              Wsize: double.infinity,
                              icono: Icon(Icons.facebook, color: Colors.white),
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: 20),
                            const LoveTextField(
                              Placeholder: 'Instagram',
                              Wsize: double.infinity,
                              icono: Icon(Icons.center_focus_strong,
                                  color: Colors.white),
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
