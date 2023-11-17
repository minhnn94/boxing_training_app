import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/routers/router_name.dart';
import 'package:boxing_traning/screens/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/screens/timing_screen/widgets/render_time_component.dart';
import 'package:boxing_traning/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/utils/color_utils.dart';
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
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.pushNamed(RouterPath.setupScreen);
                    },
                  )
                ],
              );
            },
          ),
        ),
        body: Padding(
          padding: PAD_H16,
          child: Column(
            children: [
              SIZED_H32,
              TimingSelector<int>(
                selector: (state) {
                  return state.currentRound;
                },
                builder: (context, state) {
                  return Text('Current round: $state',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.trainingColor,
                      ));
                },
              ),
              SIZED_H16,
              const SizedBox(
                height: 30,
              ),
              const RenderTimeComponent(),
              SIZED_H32,
              Center(
                child: InkWell(
                  onTap: context.read<TimingCubit>().handleOnPressButtonProcess,
                  child: TimingSelector<bool>(
                    selector: (state) {
                      return state.isRunning;
                    },
                    builder: (context, state) {
                      return Container(
                        width: double.infinity,
                        color: getAppBarColor(state),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        child: BlocSelector<TimingCubit, TimingState, bool>(
                          selector: (state) {
                            return state.isRunning;
                          },
                          builder: (context, state) {
                            return Text(state ? 'Pause' : 'Start',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
