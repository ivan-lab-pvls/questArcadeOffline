import 'package:flutter/material.dart';

enum CardState { hidden, visible, guessed }

class CardModel {
  final int value;
  final int digit;
  CardState state;

  CardModel({
    required this.value,
    required this.digit,
    this.state = CardState.hidden,
  });
}