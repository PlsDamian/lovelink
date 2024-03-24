import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lovelink/models/matchPerson.dart';
import 'package:lovelink/views/components/LoveLinkCard.dart';
import 'package:lovelink/constants.dart';


class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {

  void inputLike(MatchPerson data) {
    print("Like a ${data.name}");
  }

  void inputDislike(MatchPerson data) {
    print("Dislike a ${data.name}");
  }

  List<MatchPerson> profiles = [
    MatchPerson(
      id: 1,
      name: "Talia",
      age: 21,
      gender: 'Indefinido',
      photo: "assets/images/cat.jpg",
      description: "Description...",
    ),
    MatchPerson(
      id: 2,
      name: "Talia",
      age: 20,
      gender: 'Indefinido',
      photo: "assets/images/cat.jpg",
      description: "Description...",
    ),
    MatchPerson(
      id: 3,
      name: "Talia",
      age: 19,
      gender: 'Indefinido',
      photo: "assets/images/cat.jpg",
      description: "Description...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Flexible(
            child: CardSwiper(
          allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
              horizontal: true, vertical: true),
          onSwipe: (value1, value2, value3) {
            if (value3 == CardSwiperDirection.right) {
              inputLike(profiles[value1]);
            } else {
              inputDislike(profiles[value1]);
            }
            return true;
          },
          cardsCount: profiles.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              LoveLinkCard(
            like: () => inputLike(profiles[index]),
            dislike: () => inputDislike(profiles[index]),
            matchData: profiles[index],
          ),
        )));
  }
}

/*
* ExpandableCarousel(
        options: CarouselOptions(
          autoPlay: false,
          showIndicator: false,
          autoPlayInterval: const Duration(seconds: 2),
        ),
        items: profiles.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: LoveLinkCard(
                    like: ()=>inputLike(i),
                    dislike: ()=>inputDislike(i),
                    matchData: i,
                  ));
            },
          );
        }).toList(),
      )*/
