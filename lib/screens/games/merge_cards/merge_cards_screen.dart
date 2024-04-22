import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest_arcade_app/router/router.dart';
import 'package:quest_arcade_app/theme/colors.dart';

@RoutePage()
class MergeCardsScreen extends StatefulWidget {
  const MergeCardsScreen({super.key});

  @override
  State<MergeCardsScreen> createState() => _MergeCardsScreenState();
}

class _MergeCardsScreenState extends State<MergeCardsScreen> {
  List<int> cardNumbers = List.generate(16, (_) => Random().nextInt(15) + 1);
  List<int> playerCards = [];
  int score = 0;

  void updateGame(int index) {
    setState(() {
      playerCards.add(cardNumbers[index]);
      cardNumbers[index] = Random().nextInt(15) + 1;

      if (playerCards.length > 2) {
        for (int i = 0; i < playerCards.length - 2; i++) {
          if (playerCards[i] == playerCards[i + 1] &&
              playerCards[i] == playerCards[i + 2]) {
            playerCards.removeRange(i, i + 3);
            score += 10;
          }
        }
      }

      if (playerCards.length > 8) {
        context.router.push(MergeCardsWinRoute(coins: score));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/elements/game-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.push(HomeRoute());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.white15,
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0))),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Merge cards',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 180,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.white15,
                          border:
                          Border.all(color: AppColors.blueBorder, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/elements/coin.png'),
                          SizedBox(width: 5),
                          Text(
                            '${score}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisCount: 4,
                      ),
                      itemCount: cardNumbers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => updateGame(index),
                          child: Center(
                            child: SvgPicture.asset('assets/images/merge-cards/${cardNumbers[index]}.svg'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.white15,
                          border:
                          Border.all(color: AppColors.blueBorder, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Text(
                        'Tap to collect three identical cards to merge them',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.white15,
                            border: Border.all(color: AppColors.blueBorder, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(8.0))),
                        height: 100,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: playerCards.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: SvgPicture.asset('assets/images/merge-cards/${playerCards[index]}.svg', width: 40,),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
