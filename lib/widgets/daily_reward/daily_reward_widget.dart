import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_arcade_app/theme/colors.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:quest_arcade_app/widgets/daily_reward/bloc/daily_reward_bloc.dart';

class DailyRewardWidget extends StatefulWidget {
  const DailyRewardWidget({super.key});

  @override
  State<DailyRewardWidget> createState() => _DailyRewardWidgetState();
}

class _DailyRewardWidgetState extends State<DailyRewardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyRewardBloc()..add(CheckDailyRewardEvent()),
      child: BlocConsumer<DailyRewardBloc, DailyRewardState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SuccessDailyRewardState) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/elements/daily-reward-bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Get 150 free coins',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<DailyRewardBloc>()
                          .add(GetDailyRewardEvent());
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: AppColors.blueGradient,
                          border:
                              Border.all(color: AppColors.blueBorder, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Text(
                        'Get bonus',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (state is FailureDailyRewardState) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/elements/daily-reward-bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Get 150 free coins',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.white15,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Row(
                          children: [
                            Text(
                              'Come back in ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            CountdownTimer(
                              endWidget: const Center(child: Text('00:00:00')),
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              endTime: DateTime.now().millisecondsSinceEpoch +
                                  state.timeLeft,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 1),
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
