import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/time_utils.dart';
import 'package:flutter/material.dart';

class RowOfDetail extends StatelessWidget {
  const RowOfDetail({
    super.key,
    required this.title,
    required this.totalSeconds,
  });
  final String title;
  final int totalSeconds;

  @override
  Widget build(BuildContext context) {
    String getTimeDisplay(int seconds) {
      final duration = Duration(seconds: seconds);
      return TimeUtils.getTimeDisplayLikeClock(duration);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorUtils.primary),
        ),
        Text(
          getTimeDisplay(totalSeconds),
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorUtils.primary),
        ),
      ],
    );
  }
}
