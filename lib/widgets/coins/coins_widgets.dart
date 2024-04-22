import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_arcade_app/theme/colors.dart';
import 'package:quest_arcade_app/widgets/coins/bloc/coins_bloc.dart';

class CoinsWidget extends StatefulWidget {
  const CoinsWidget({super.key});

  @override
  State<CoinsWidget> createState() => _CoinsWidgetState();
}

class _CoinsWidgetState extends State<CoinsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinsBloc()..add(GetCoinsEvent()),
      child: BlocConsumer<CoinsBloc, CoinsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadedCoinsState) {
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: AppColors.blueGradient,
                  border: Border.all(
                      color: AppColors.blueBorder, width: 2),
                  borderRadius:
                  BorderRadius.all(Radius.circular(8.0))),
              child: Row(
                children: [
                  Image.asset('assets/images/elements/coin.png'),
                  SizedBox(width: 5),
                  Text(
                    '${state.coins}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
