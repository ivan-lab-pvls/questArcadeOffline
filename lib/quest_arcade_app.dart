import 'package:flutter/material.dart';
import 'package:quest_arcade_app/router/router.dart';

class QuestArcadeApp extends StatelessWidget {
  QuestArcadeApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Jost'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
