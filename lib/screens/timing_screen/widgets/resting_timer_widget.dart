import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/time_utils.dart';
import 'package:boxing_traning/screens/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/screens/timing_screen/timing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RestingTimerWidget extends StatelessWidget {
  const RestingTimerWidget({
    super.key,
  });
  String getTimeDisplay(int seconds) {
    final duration = Duration(seconds: seconds);
    return TimeUtils.getTimeDisplayLikeClock(duration);
  }

  @override
  Widget build(BuildContext context) {
    return TimingSelector<int>(
      selector: (state) {
        return state.restTime;
      },
      builder: (context, state) {
        final totalTime = context
            .read<TimingCubit>()
            .martialArtModel
            .restingModel
            .restingTime;
        return Column(
          children: [
            CircularPercentIndicator(
              radius: 150,
              lineWidth: 150,
              percent: state / totalTime,
              center: Text(
                getTimeDisplay(state),
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.white,
                ),
              ),
              progressColor: ColorUtils.restingColor,
            ),
          ],
        );
      },
    );
  }
}
