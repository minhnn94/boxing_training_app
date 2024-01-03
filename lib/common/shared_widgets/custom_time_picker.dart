import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'cupertino_time_custom.dart';

const double timeHeight = 200;

class TimePickerCustom extends StatefulWidget {
  const TimePickerCustom({
    super.key,
    this.callBack,
    this.totalSeconds,
  });

  final int? totalSeconds;
  final Function(int totalSecons)? callBack;

  @override
  State<TimePickerCustom> createState() => _TimePickerCustomState();
}

class _TimePickerCustomState extends State<TimePickerCustom> {
  int minutesSelected = 0;

  int secondsSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minutesSelected = getMinutes();
    secondsSelected = getSeconds();
  }

  void _handleOnPressCancel() {
    context.pop();
  }

  void _handleOnPressDone() {
    int totalSeconds = minutesSelected * 60 + secondsSelected;
    widget.callBack?.call(totalSeconds);
    context.pop();
  }

  int getMinutes() {
    int timeAround = widget.totalSeconds ?? 0;
    return (timeAround - getSeconds()) ~/ 60;
  }

  int getSeconds() {
    return (widget.totalSeconds ?? 0) % 60;
  }

  @override
  Widget build(BuildContext context) {
    final localLanguage = AppLocalizationUtils.instance();

    return Material(
      color: ColorUtils.white,
      child: Container(
        height: 280,
        color: ColorUtils.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: _handleOnPressCancel,
                  child: Padding(
                    padding: padAll16,
                    child: Text(
                      localLanguage.cancel,
                      style: TextStyleUtils.text14Weight600
                          .copyWith(color: ColorUtils.restingColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: _handleOnPressDone,
                  child: Padding(
                    padding: padAll16,
                    child: Text(
                      localLanguage.done,
                      style: TextStyleUtils.text14Weight600
                          .copyWith(color: ColorUtils.primary),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: timeHeight,
                    child: Column(
                      children: [
                        sizedHeight16,
                        Expanded(
                          child: CupertinoTimeCustom(
                              initialValue: getMinutes(),
                              onSelectedItemChanged: (minutes) {
                                minutesSelected = minutes;
                              }),
                        ),
                        Text(
                          localLanguage.minutes,
                          style: TextStyleUtils.text16Weight600Gradient,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    ':',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: timeHeight,
                    child: Column(
                      children: [
                        sizedHeight16,
                        Expanded(
                          child: CupertinoTimeCustom(
                            initialValue: getSeconds(),
                            onSelectedItemChanged: (seconds) {
                              secondsSelected = seconds;
                            },
                          ),
                        ),
                        Text(
                          localLanguage.seconds,
                          style: TextStyleUtils.text16Weight600Gradient,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
