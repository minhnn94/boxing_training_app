import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/utils/color_utils.dart';
import 'package:flutter/material.dart';

import 'cupertino_time_custom.dart';

class TimePickerCustom extends StatelessWidget {
  const TimePickerCustom({
    super.key,
    this.minutes,
    this.seconds,
  });
  final int? minutes;
  final int? seconds;
  @override
  Widget build(BuildContext context) {
    final localLanguage = AppLocalizationUtils.instance();

    return Material(
      color: ColorUtils.white,
      child: Container(
        height: 190,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 180,
                    child: Column(
                      children: [
                        Text(
                          localLanguage.minutes,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: CupertinoTimeCustom(
                            initialValue: minutes ?? 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    ':',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 180,
                    child: Column(
                      children: [
                        Text(
                          localLanguage.seconds,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: CupertinoTimeCustom(
                            initialValue: seconds ?? 0,
                          ),
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
