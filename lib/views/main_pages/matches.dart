import 'package:flutter/material.dart';
import 'package:lovelink/views/components/PositionedText.dart';
import 'package:lovelink/views/components/MatchButton.dart';
import 'package:lovelink/views/components/ReadMore.dart';
import 'package:lovelink/views/components/LoveNavBar.dart';


class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

void inputLike() {
  print("Like");
}

void inputDislike() {
  print("Dislike");
}

class _MatchesState extends State<Matches> {
  int _currentIndex = 1;

  void tabNavigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292929),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            width: 300,
            height: 500,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/cat.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.transparent),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0))),
                ),
                const PositionedText(
                  textLabel: "Genero: Hombre",
                  top: 7,
                  left: 160,
                  textSize: 16,
                  width: 140,
                  height: 60,
                ),
                const PositionedText(
                  textLabel: "Edad: 22",
                  top: 30,
                  left: 160,
                  textSize: 16,
                  width: 130,
                  height: 60,
                ),
                const PositionedText(
                  textLabel: "Daniel",
                  top: 5,
                  left: 10,
                  textSize: 23,
                  width: 140,
                  height: 160,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: inputDislike,
                          child: const MatchButton(
                            colorin: Color(0xffffa31a),
                            colorbor: Color(0xff1b1b1b),
                            imagePath: "assets/icons/Xg.png",
                          ),
                        ),
                        GestureDetector(
                          onTap: inputLike,
                          child: const MatchButton(
                            colorin: Color(0xFF292929),
                            colorbor: Color(0xffffa31a),
                            imagePath: "assets/icons/Corazon.png",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ReadMore(descripcion: "Me llamo Daniel"
              "\n"
              "\nMe gusta la musica de todo tipo pero sobre todo tranquila y los videojuegos"
              "\n"
              "\nTengo 2 perros y si tienes 1 gato podemos conocermos 😊"
              "\n"
              "\n¡Espero conocerte pronto!")
        ],
      ),
      bottomNavigationBar: LoveNavBar(
        currentIndex: _currentIndex,
        onTabChange: tabNavigation,
      ),
    );
  }
}