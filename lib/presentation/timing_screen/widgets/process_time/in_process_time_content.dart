import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/timing_process_button.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../finished_time/render_time_component.dart';

class InProcessTime extends StatelessWidget {
  const InProcessTime({super.key});
  bool _getButtonBuildWhen(TimingPlayState previous, TimingPlayState current) {
    return previous.isPreparing != current.isPreparing ||
        previous.isRunning != current.isRunning ||
        previous.isPause != current.isPause;
  }

  Color _getColorProcess(bool isPrepare) {
    if (isPrepare) {
      return ColorUtils.grey;
    } else {
      return ColorUtils.orange;
    }
  }

  IconData _getIconProcess(bool isPause) {
    if (isPause) {
      return Icons.play_arrow;
    } else {
      return Icons.pause;
    }
  }

  void _handleOnPressBackAndSave(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TimingCubit>();

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: const [
                sizedHeight80,
                RenderTimeComponent(),
                sizedHeight32,
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocBuilder<TimingCubit, TimingPlayState>(
                buildWhen: _getButtonBuildWhen,
                builder: (context, state) {
                  return TimingProcessButton(
                      onPress: cubit.handleOnPressButtonProcess,
                      icon: Icon(
                        _getIconProcess(state.isPause),
                        size: 60,
                        color: ColorUtils.white,
                      ),
                      centerColor: _getColorProcess(state.isPreparing));
                },
              ),
              TimingProcessButton(
                onPress: cubit.handleOnPressFinish,
                icon: Center(
                  child: Container(
                    width: 26,
                    height: 26,
                    color: ColorUtils.white,
                  ),
                ),
                centerColor: ColorUtils.recordColor,
              )
            ],
          ),
          sizedHeight32,
          sizedHeight32,
        ],
      ),
    );
  }
}
