import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/appbar_common.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/presentation/timing_screen/widgets/render_time_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/round_indicator.dart';

typedef TimingSelector<T> = BlocSelector<TimingCubit, TimingState, T>;

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

  bool _getButtonBuildWhen(TimingState previous, TimingState current) {
    return previous.isPreparing != current.isPreparing ||
        previous.isRunning != current.isRunning ||
        previous.isPause != current.isPause;
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBarCommon(
          title: 'Sport',
        ),
        body: Padding(
          padding: PAD_H16,
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
                  BlocBuilder<TimingCubit, TimingState>(
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
              Expanded(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    sizedHeight32,
                    sizedHeight16,
                    RenderTimeComponent(),
                    sizedHeight32,
                  ],
                ),
              ),
              BlocBuilder<TimingCubit, TimingState>(
                buildWhen: _getButtonBuildWhen,
                builder: (context, state) {
                  return CommonButton(
                    disable: state.isPreparing,
                    backgroundColor: getAppBarColor(state.isRunning),
                    title: getTitleButton(state.isPause),
                    onPress:
                        context.read<TimingCubit>().handleOnPressButtonProcess,
                  );
                },
              )
            ],
          ),
        ));
  }
}
