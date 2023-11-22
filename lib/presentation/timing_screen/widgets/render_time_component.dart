import 'package:boxing_traning/presentation/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/presentation/timing_screen/widgets/resting_timer_widget.dart';
import 'package:boxing_traning/presentation/timing_screen/widgets/training_timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'prepare_time_widget.dart';

class RenderTimeComponent extends StatelessWidget {
  const RenderTimeComponent({
    super.key,
  });
  bool _getBuildWhen(TimingState previous, TimingState current) {
    return previous.isPreparing != current.isPreparing ||
        previous.isRunning != current.isRunning;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimingCubit, TimingState>(
        buildWhen: _getBuildWhen,
        builder: (context, state) {
          if (state.isPreparing) {
            return PrepareTimeWidget(
              prepareTime: state.prepareTime,
              onPrepareDone: () {
                context.read<TimingCubit>().onPrepareDone();
              },
            );
          } else {
            if (state.isRunning) {
              return const TrainingTimerWidget();
            } else {
              return const RestingTimerWidget();
            }
          }
        });
  }
}
