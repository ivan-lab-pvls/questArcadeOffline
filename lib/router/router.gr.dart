// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CheckersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CheckersScreen(),
      );
    },
    CheckersWinRoute.name: (routeData) {
      final args = routeData.argsAs<CheckersWinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CheckersWinScreen(
          key: args.key,
          winner: args.winner,
        ),
      );
    },
    FindNumbersLevelsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FindNumbersLevelsScreen(),
      );
    },
    FindNumbersRoute.name: (routeData) {
      final args = routeData.argsAs<FindNumbersRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FindNumbersScreen(
          key: args.key,
          level: args.level,
        ),
      );
    },
    FindNumbersWinRoute.name: (routeData) {
      final args = routeData.argsAs<FindNumbersWinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FindNumbersWinScreen(
          key: args.key,
          coins: args.coins,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MergeCardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MergeCardsScreen(),
      );
    },
    MergeCardsWinRoute.name: (routeData) {
      final args = routeData.argsAs<MergeCardsWinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MergeCardsWinScreen(
          key: args.key,
          coins: args.coins,
        ),
      );
    },
    MergeNumbersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MergeNumbersScreen(),
      );
    },
    MergeNumbersWinRoute.name: (routeData) {
      final args = routeData.argsAs<MergeNumbersWinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MergeNumbersWinScreen(
          key: args.key,
          score: args.score,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [CheckersScreen]
class CheckersRoute extends PageRouteInfo<void> {
  const CheckersRoute({List<PageRouteInfo>? children})
      : super(
          CheckersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CheckersWinScreen]
class CheckersWinRoute extends PageRouteInfo<CheckersWinRouteArgs> {
  CheckersWinRoute({
    Key? key,
    required String winner,
    List<PageRouteInfo>? children,
  }) : super(
          CheckersWinRoute.name,
          args: CheckersWinRouteArgs(
            key: key,
            winner: winner,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckersWinRoute';

  static const PageInfo<CheckersWinRouteArgs> page =
      PageInfo<CheckersWinRouteArgs>(name);
}

class CheckersWinRouteArgs {
  const CheckersWinRouteArgs({
    this.key,
    required this.winner,
  });

  final Key? key;

  final String winner;

  @override
  String toString() {
    return 'CheckersWinRouteArgs{key: $key, winner: $winner}';
  }
}

/// generated route for
/// [FindNumbersLevelsScreen]
class FindNumbersLevelsRoute extends PageRouteInfo<void> {
  const FindNumbersLevelsRoute({List<PageRouteInfo>? children})
      : super(
          FindNumbersLevelsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindNumbersLevelsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FindNumbersScreen]
class FindNumbersRoute extends PageRouteInfo<FindNumbersRouteArgs> {
  FindNumbersRoute({
    Key? key,
    required LevelModel level,
    List<PageRouteInfo>? children,
  }) : super(
          FindNumbersRoute.name,
          args: FindNumbersRouteArgs(
            key: key,
            level: level,
          ),
          initialChildren: children,
        );

  static const String name = 'FindNumbersRoute';

  static const PageInfo<FindNumbersRouteArgs> page =
      PageInfo<FindNumbersRouteArgs>(name);
}

class FindNumbersRouteArgs {
  const FindNumbersRouteArgs({
    this.key,
    required this.level,
  });

  final Key? key;

  final LevelModel level;

  @override
  String toString() {
    return 'FindNumbersRouteArgs{key: $key, level: $level}';
  }
}

/// generated route for
/// [FindNumbersWinScreen]
class FindNumbersWinRoute extends PageRouteInfo<FindNumbersWinRouteArgs> {
  FindNumbersWinRoute({
    Key? key,
    required int coins,
    List<PageRouteInfo>? children,
  }) : super(
          FindNumbersWinRoute.name,
          args: FindNumbersWinRouteArgs(
            key: key,
            coins: coins,
          ),
          initialChildren: children,
        );

  static const String name = 'FindNumbersWinRoute';

  static const PageInfo<FindNumbersWinRouteArgs> page =
      PageInfo<FindNumbersWinRouteArgs>(name);
}

class FindNumbersWinRouteArgs {
  const FindNumbersWinRouteArgs({
    this.key,
    required this.coins,
  });

  final Key? key;

  final int coins;

  @override
  String toString() {
    return 'FindNumbersWinRouteArgs{key: $key, coins: $coins}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MergeCardsScreen]
class MergeCardsRoute extends PageRouteInfo<void> {
  const MergeCardsRoute({List<PageRouteInfo>? children})
      : super(
          MergeCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MergeCardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MergeCardsWinScreen]
class MergeCardsWinRoute extends PageRouteInfo<MergeCardsWinRouteArgs> {
  MergeCardsWinRoute({
    Key? key,
    required int coins,
    List<PageRouteInfo>? children,
  }) : super(
          MergeCardsWinRoute.name,
          args: MergeCardsWinRouteArgs(
            key: key,
            coins: coins,
          ),
          initialChildren: children,
        );

  static const String name = 'MergeCardsWinRoute';

  static const PageInfo<MergeCardsWinRouteArgs> page =
      PageInfo<MergeCardsWinRouteArgs>(name);
}

class MergeCardsWinRouteArgs {
  const MergeCardsWinRouteArgs({
    this.key,
    required this.coins,
  });

  final Key? key;

  final int coins;

  @override
  String toString() {
    return 'MergeCardsWinRouteArgs{key: $key, coins: $coins}';
  }
}

/// generated route for
/// [MergeNumbersScreen]
class MergeNumbersRoute extends PageRouteInfo<void> {
  const MergeNumbersRoute({List<PageRouteInfo>? children})
      : super(
          MergeNumbersRoute.name,
          initialChildren: children,
        );

  static const String name = 'MergeNumbersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MergeNumbersWinScreen]
class MergeNumbersWinRoute extends PageRouteInfo<MergeNumbersWinRouteArgs> {
  MergeNumbersWinRoute({
    Key? key,
    required int score,
    List<PageRouteInfo>? children,
  }) : super(
          MergeNumbersWinRoute.name,
          args: MergeNumbersWinRouteArgs(
            key: key,
            score: score,
          ),
          initialChildren: children,
        );

  static const String name = 'MergeNumbersWinRoute';

  static const PageInfo<MergeNumbersWinRouteArgs> page =
      PageInfo<MergeNumbersWinRouteArgs>(name);
}

class MergeNumbersWinRouteArgs {
  const MergeNumbersWinRouteArgs({
    this.key,
    required this.score,
  });

  final Key? key;

  final int score;

  @override
  String toString() {
    return 'MergeNumbersWinRouteArgs{key: $key, score: $score}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
