import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/shared_widgets/custom_time_picker.dart';
import 'package:boxing_traning/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  const SettingButton(
      {super.key, this.title = '', this.onPress, this.time = '', j});
  final Function? onPress;
  final String title;
  final String time;
  void showIOSDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx, builder: (_) => const TimePickerCustom());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showIOSDatePicker(context),
      child: Container(
          width: double.infinity,
          padding: PAD_H16,
          decoration: const BoxDecoration(
              color: ColorUtils.primary,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.white,
                ),
              ),
              Row(
                children: [
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
