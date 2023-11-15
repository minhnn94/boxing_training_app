import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/screens/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/utils/color_utils.dart';
import 'package:boxing_traning/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TimingScreen extends StatefulWidget {
  const TimingScreen({super.key});

  @override
  State<TimingScreen> createState() => _TimingScreenState();
}

class _TimingScreenState extends State<TimingScreen> {
  Timer? _timer;
  int _start = 300;
  int totalRound = 5;

  void _playSound() {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/mp3/boxing-bell.mp3"),
    );
  }

  void _changeTimer(Timer timer) {
    if (_start == 0) {
      setState(() {
        timer.cancel();
      });
    } else {
      setState(() {
        _start--;
      });
    }
  }

  String getTimeDisplay(int seconds) {
    final duration = Duration(seconds: seconds);
    return TimeUtils.getTimeDisplayLikeClock(duration);
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: context.pop,
            child: Icon(Icons.arrow_back_rounded),
          ),
          title: Text('Timing Screen'),
        ),
        body: Padding(
          padding: PAD_H16,
          child: Column(
            children: [
              SIZED_H32,
              Text('Total round: $totalRound',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent)),
              SIZED_H16,
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: ColorUtils.grey300,
                child: Center(
                  child: BlocBuilder<TimingCubit, TimingState>(
                    buildWhen: (previous, current) =>
                        previous.trainingTime != current.trainingTime,
                    builder: (context, state) {
                      return Text(
                        getTimeDisplay(state.trainingTime),
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent),
                      );
                    },
                  ),
                ),
              ),
              Text('$_start'),
              SIZED_H32,
              Center(
                child: InkWell(
                  onTap: context.read<TimingCubit>().handleOnPressButtonProcess,
                  child: Container(
                    width: double.infinity,
                    color: Colors.blueAccent,
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
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
