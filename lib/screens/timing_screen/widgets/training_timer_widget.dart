import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/screens/timing_screen/timing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/time_utils.dart';

class TrainingTimerWidget extends StatelessWidget {
  const TrainingTimerWidget({
    super.key,
  });
  String getTimeDisplay(int seconds) {
    final duration = Duration(seconds: seconds);
    return TimeUtils.getTimeDisplayLikeClock(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
          color: ColorUtils.trainingColor,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Center(
        child: BlocSelector<TimingCubit, TimingState, int>(
          selector: (state) => state.trainingTime,
          builder: (context, state) {
            return Text(
              getTimeDisplay(state),
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w600,
                color: ColorUtils.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
