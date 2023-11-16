import 'package:boxing_traning/screens/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/screens/timing_screen/widgets/resting_timer_widget.dart';
import 'package:boxing_traning/screens/timing_screen/widgets/training_timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RenderTimeComponent extends StatelessWidget {
  const RenderTimeComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TimingCubit, TimingState, bool>(
      selector: (state) {
        return state.isRunning;
      },
      builder: (context, state) {
        if (state) {
          return const TrainingTimerWidget();
        } else {
          return const RestingTimerWidget();
        }
      },
    );
  }
}
