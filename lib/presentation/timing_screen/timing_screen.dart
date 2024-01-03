import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/appbar_common.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/presentation/timing_screen/widgets/process_time/in_process_time_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/finished_time_content.dart';
import 'widgets/round_indicator.dart';

typedef TimingSelector<T> = BlocSelector<TimingCubit, TimingPlayState, T>;

class TimingScreen extends StatelessWidget {
  const TimingScreen({super.key});

  Color getAppBarColor(bool isRunning) {
    if (isRunning) {
      return ColorUtils.trainingColor;
    } else {
      return ColorUtils.restingColor;
    }
  }

  String getTitleButton(bool isPause) {
    if (isPause) {
      return AppLocalizationUtils.instance().resume;
    } else {
      return AppLocalizationUtils.instance().pause;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TimingCubit>();
    return BaseScaffold(
      backgroundColor: ColorUtils.backgroundColor,
      appBar: AppBarCommon(
        title: cubit.state.name,
      ),
      body: Padding(
        padding: padH16,
        child: Column(
          children: [
            sizedHeight16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizationUtils.instance().round,
                  style: TextStyleUtils.text16Weight600,
                ),
                BlocBuilder<TimingCubit, TimingPlayState>(
                  buildWhen: (previous, current) =>
                      previous.currentRound != current.currentRound,
                  builder: (context, state) {
                    return RoundIndicator(
                      totalRounds: state.roundTotal,
                      currentRound: state.currentRound,
                    );
                  },
                )
              ],
            ),
            BlocBuilder<TimingCubit, TimingPlayState>(builder: (_, state) {
              if (!state.isFinished) {
                return const InProcessTime();
              } else {
                return const FinishedTimeContent();
              }
            })
          ],
        ),
      ),
    );
  }
}
