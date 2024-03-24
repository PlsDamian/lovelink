import 'package:flutter/material.dart';
import 'package:lovelink/models/matchPerson.dart';
import 'package:lovelink/views/components/PositionedText.dart';
import 'package:lovelink/views/components/MatchButton.dart';
import 'package:lovelink/views/components/ReadMore.dart';
import 'package:lovelink/constants.dart';

class LoveLinkCard extends StatefulWidget {
  final void Function() dislike;
  final void Function() like;
  final MatchPerson matchData;

  const LoveLinkCard({
    super.key,
    required this.dislike,
    required this.like,
    required this.matchData,
  });

  @override
  State<LoveLinkCard> createState() => _LoveLinkCardState();
}

class _LoveLinkCardState extends State<LoveLinkCard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
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
                PositionedText(
                  textLabel: "Genero: ${widget.matchData.gender}",
                  top: 7,
                  left: 160,
                  textSize: 16,
                  width: 140,
                  height: 60,
                ),
                PositionedText(
                  textLabel: "Edad: ${widget.matchData.age}",
                  top: 30,
                  left: 160,
                  textSize: 16,
                  width: 130,
                  height: 60,
                ),
                PositionedText(
                  textLabel: widget.matchData.name,
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
                          onTap: widget.dislike,
                          child: const MatchButton(
                            colorin: Color(0xffffa31a),
                            colorbor: Color(0xff1b1b1b),
                            imagePath: "assets/icons/Xg.png",
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.like,
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
          ReadMore(descripcion: widget.matchData.description??"No data")
        ],
      ),
    );
  }
}
