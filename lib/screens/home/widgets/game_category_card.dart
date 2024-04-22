import 'package:flutter/material.dart';
import 'package:quest_arcade_app/theme/colors.dart';

class GameCategoryCard extends StatelessWidget {
  final String image;
  final String name;
  final void Function()? onTap;

  const GameCategoryCard(
      {super.key,
      required this.image,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.white10,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 100,
                width: 150,
              ),
            ),
            SizedBox(height: 15),
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
