import 'package:flutter/material.dart';

abstract class AppColors {
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);

  static final blueBorder = Color(0xFF1D93D0);

  static final white15 = Color(0x26FFFFFF);
  static final white10 = Color(0x1AFFFFFF);

  static final whiteSquare = Color(0xFF685D6D);
  static final blackSquare = Color(0xFF53455E);

  static final orange = Color(0xFFFF9900);

  static const blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1EB7F8),
      Color(0xFF0041B6),
    ],
  );

}
