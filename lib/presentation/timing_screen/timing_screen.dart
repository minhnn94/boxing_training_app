import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/presentation/timing_screen/widgets/render_time_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

  String getTitleButton(bool isRunning) {
    if (isRunning) {
      return AppLocalizationUtils.instance().pause;
    } else {
      return AppLocalizationUtils.instance().start;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: TimingSelector<bool>(
            selector: (state) {
              return state.isRunning;
            },
            builder: (context, state) {
              return AppBar(
                backgroundColor: getAppBarColor(state),
                leading: InkWell(
                  onTap: context.pop,
                  child: const Icon(Icons.arrow_back_rounded),
                ),
                title: const Text('Timing Screen'),
              );
            },
          ),
        ),
        body: Padding(
          padding: PAD_H16,
          child: Column(
            children: [
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
              TimingSelector<bool>(
                selector: (state) {
                  return state.isRunning;
                },
                builder: (context, state) {
                  return CommonButton(
                    backgroundColor: getAppBarColor(state),
                    title: getTitleButton(state),
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
