import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quest_arcade_app/router/router.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/models/card_model.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/models/level_model.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/repository/levels_repository.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/widgets/card_widget.dart';
import 'package:quest_arcade_app/theme/colors.dart';

@RoutePage()
class FindNumbersScreen extends StatefulWidget {
  final LevelModel level;

  const FindNumbersScreen({super.key, required this.level});

  @override
  State<FindNumbersScreen> createState() => _FindNumbersScreenState();
}

class _FindNumbersScreenState extends State<FindNumbersScreen> {
  @override
  void initState() {
    super.initState();
    generateCards();
  }

  int coins = 0;
  List<CardModel> cards = [];
  bool isGameOver = false;

  void generateCards() {
    cards = [];
    for (int i = 0; i < widget.level.digitsCount; i++) {
      final cardValue = i + 1;
      final int digit = Random().nextInt(10);
      final CardModel newCard = _createCardModel(digit, cardValue);
      final CardModel newCardDuplicate = _createCardModel(digit, cardValue + 1);
      cards.add(newCard);
      cards.add(newCardDuplicate);
    }
    cards.shuffle(Random());
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
  }

  void onCardPressed(int index) {
    setState(() {
      cards[index].state = CardState.visible;
    });
    final List<int> visibleCardIndexes = _getVisibleCardIndexes();
    if (visibleCardIndexes.length == 2) {
      final CardModel card1 = cards[visibleCardIndexes[0]];
      final CardModel card2 = cards[visibleCardIndexes[1]];
      if (card1.digit == card2.digit) {
        card1.state = CardState.guessed;
        card2.state = CardState.guessed;
        coins += 10;
        isGameOver = _isGameOver();
        if (isGameOver) {
          Future.delayed(const Duration(seconds: 1), () {
            widget.level.isDone = true;
            if (widget.level.number != 7) {
              findNumbersLevelsRepository[widget.level.number + 1].isAvailable =
              true;
            }
            context.router.push(FindNumbersWinRoute(coins: coins));
          });
        }
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            card1.state = CardState.hidden;
            card2.state = CardState.hidden;
          });
        });
      }
    }
  }

  CardModel _createCardModel(int digit, int cardValue) {
    return CardModel(
      value: cardValue,
      digit: digit,
    );
  }

  List<int> _getVisibleCardIndexes() {
    return cards
        .asMap()
        .entries
        .where((entry) => entry.value.state == CardState.visible)
        .map((entry) => entry.key)
        .toList();
  }

  bool _isGameOver() {
    return cards.every((card) => card.state == CardState.guessed);
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'Find the numbers',
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
                            '${coins}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 75 * (widget.level.digitsCount / 8),
                      child: GridView.builder(
                        itemCount: cards.length,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 10,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                        itemBuilder: (BuildContext context, int index) {
                          return CardWidget(
                            index: index,
                            card: cards[index],
                            onCardPressed: onCardPressed,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
