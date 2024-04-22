import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:quest_arcade_app/screens/games/checkers/checkers_screen.dart';
import 'package:quest_arcade_app/screens/games/checkers/checkers_win_screen.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/find_numbers_levels_screen.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/find_numbers_screen.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/find_numbers_win_screen.dart';
import 'package:quest_arcade_app/screens/games/merge_cards/merge_cards_screen.dart';
import 'package:quest_arcade_app/screens/games/merge_cards/merge_cards_win_screen.dart';
import 'package:quest_arcade_app/screens/games/merge_numbers/merge_numbers_screen.dart';
import 'package:quest_arcade_app/screens/games/merge_numbers/merge_numbers_win_screen.dart';
import 'package:quest_arcade_app/screens/home/home_screen.dart';
import 'package:quest_arcade_app/screens/splash/splash_screen.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/models/level_model.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: CheckersRoute.page),
    AutoRoute(page: CheckersWinRoute.page),
    AutoRoute(page: MergeNumbersRoute.page),
    AutoRoute(page: MergeNumbersWinRoute.page),
    AutoRoute(page: FindNumbersLevelsRoute.page),
    AutoRoute(page: FindNumbersRoute.page),
    AutoRoute(page: FindNumbersWinRoute.page),
    AutoRoute(page: MergeCardsRoute.page),
    AutoRoute(page: MergeCardsWinRoute.page),

  ];
}