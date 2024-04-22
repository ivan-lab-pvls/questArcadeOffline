
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest_arcade_app/screens/games/find_numbers/models/card_model.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    required this.card,
    required this.index,
    required this.onCardPressed,
    super.key,
  });

  final CardModel card;
  final int index;
  final ValueChanged<int> onCardPressed;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void _handleCardTap() {
    if (widget.card.state == CardState.hidden) {
      Timer(const Duration(milliseconds: 100), () {
        widget.onCardPressed(widget.index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleCardTap,
      child: Center(
          child: widget.card.state == CardState.hidden
              ? Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/find-numbers/card.svg',
                width: 70,
              ),
              Text('${widget.card.digit}', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),),
            ],
          )
              : Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/find-numbers/chosen-card.svg',
                width: 70,
              ),
              Text('${widget.card.digit}', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),),
            ],
          )),
    );
  }
}
