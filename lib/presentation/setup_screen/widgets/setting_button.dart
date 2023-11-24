import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/gradient.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/shared_widgets/custom_time_picker.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:boxing_traning/common/time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    super.key,
    this.title = '',
    this.onPress,
    this.time = 0,
    this.onChangeTime,
  });
  final Function(int seconds)? onPress;
  final String title;
  final int time;
  final Function(int)? onChangeTime;
  void showIOSTimePicker(ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => TimePickerCustom(
        totalSeconds: time,
        callBack: onChangeTime,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showIOSTimePicker(context),
      child: Container(
          width: double.infinity,
          padding: padH16,
          decoration: const BoxDecoration(
              gradient: linearGradientCommon,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyleUtils.text16Weight600
                    .copyWith(color: ColorUtils.white),
              ),
              Row(
                children: [
                  Text(
                    TimeUtils.getTimeDisplayLikeClock(Duration(seconds: time)),
                    style: TextStyleUtils.text14Weight600
                        .copyWith(color: ColorUtils.white),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.arrow_drop_up_sharp,
                            color: ColorUtils.white,
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: ColorUtils.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
