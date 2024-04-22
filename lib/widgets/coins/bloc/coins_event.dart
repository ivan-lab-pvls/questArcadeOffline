part of 'coins_bloc.dart';

@immutable
abstract class CoinsEvent {}

class GetCoinsEvent extends CoinsEvent {}

class AddCoinsEvent extends CoinsEvent {
  final int coins;

  AddCoinsEvent({required this.coins});
}
