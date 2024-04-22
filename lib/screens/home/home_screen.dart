import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest_arcade_app/router/router.dart';
import 'package:quest_arcade_app/screens/home/widgets/game_category_card.dart';
import 'package:quest_arcade_app/theme/colors.dart';
import 'package:quest_arcade_app/widgets/coins/coins_widgets.dart';
import 'package:quest_arcade_app/widgets/daily_reward/daily_reward_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'QuestArcade',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.white15,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: SvgPicture.asset(
                              'assets/images/elements/settings.svg'),
                        ),
                      ),
                      SizedBox(width: 20),
                      CoinsWidget(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              DailyRewardWidget(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GameCategoryCard(
                      image: 'assets/images/home/merge-numbers.png',
                      name: 'Merge numbers',
                      onTap: () {
                        context.router.push(MergeNumbersRoute());
                      }),
                  GameCategoryCard(
                      image: 'assets/images/home/find-the-number.png',
                      name: 'Find the number',
                      onTap: () {
                        context.router.push(FindNumbersLevelsRoute());
                      }),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GameCategoryCard(
                      image: 'assets/images/home/merge-cards.png',
                      name: 'Merge cards',
                      onTap: () {
                        context.router.push(MergeCardsRoute());
                      }),
                  GameCategoryCard(
                      image: 'assets/images/home/checkers.png',
                      name: 'Checkers',
                      onTap: () {
                        context.router.push(CheckersRoute());
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
