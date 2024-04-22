import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quest_arcade_app/router/router.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/models/level_model.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/repository/levels_repository.dart';
import 'package:quest_arcade_app/theme/colors.dart';
import 'package:quest_arcade_app/widgets/coins/coins_widgets.dart';

@RoutePage()
class FindNumbersLevelsScreen extends StatefulWidget {
  const FindNumbersLevelsScreen({super.key});

  @override
  State<FindNumbersLevelsScreen> createState() => _FindNumbersLevelsScreenState();
}

class _FindNumbersLevelsScreenState extends State<FindNumbersLevelsScreen> {
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
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
                        SizedBox(width: 10),
                        Text(
                          'Find the number',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    CoinsWidget(),
                  ],
                ),
            Expanded(
              child: GridView.builder(
                itemCount: findNumbersLevelsRepository.length,
                padding: EdgeInsets.zero,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  final LevelModel level =  findNumbersLevelsRepository[index];
                  return GestureDetector(
                    onTap: ()  {
                      if (level.isAvailable || level.isDone) {
                        context.router.push(FindNumbersRoute(level: level));
                      }
                    },
                    child: Container(
                      child: Image.asset(level.isDone ? level.doneImage : level.isAvailable ? level.levelImage : level.disableImage),
                    )
                  );
                },
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
