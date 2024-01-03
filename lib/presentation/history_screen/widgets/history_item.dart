import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:boxing_traning/common/time_utils.dart';
import 'package:boxing_traning/domain/models/history_template.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.item});
  final HistoryTemplate item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padH16V12,
      color: ColorUtils.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TimeUtils.getTimeClockTraining(item.dateTime ?? 0),
            style: TextStyleUtils.text16Weight600,
          ),
          Text(
            item.nameSport ?? "",
            style: TextStyleUtils.text16Weight600,
          ),
        ],
      ),
    );
  }
}
