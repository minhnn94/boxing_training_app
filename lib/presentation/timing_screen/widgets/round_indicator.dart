import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/gradient.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:flutter/material.dart';

class RoundIndicator extends StatelessWidget {
  const RoundIndicator(
      {super.key, required this.totalRounds, required this.currentRound});
  final int totalRounds;
  final int currentRound;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalRounds, (index) {
        if (index < currentRound) {
          return Row(
            children: [
              Container(
                width: 20,
                height: 10,
                decoration: const BoxDecoration(
                  gradient: linearGradientCommon,
                ),
              ),
              sizedWidth08,
            ],
          );
        } else {
          return Row(
            children: [
              Container(
                width: 20,
                height: 10,
                color: ColorUtils.grey300,
              ),
              sizedWidth08,
            ],
          );
        }
      }),
    );
  }
}
