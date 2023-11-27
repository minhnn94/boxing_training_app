import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.martial,
    this.onPressConfirm,
  });
  final MartialTemplate martial;
  final Function()? onPressConfirm;

  @override
  Widget build(BuildContext context) {
    final translation = AppLocalizationUtils.instance();
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: width,
                child: Column(
                  children: [
                    Text(
                      translation.doYouWantToDeleteSport(martial.name ?? ''),
                      style: TextStyleUtils.text16Weight600
                          .copyWith(color: ColorUtils.black),
                    ),
                    const Divider(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: CommonButton(
                            backgroundColor: ColorUtils.grey200,
                            title: AppLocalizationUtils.instance().cancel,
                            onPress: () {
                              context.pop();
                            },
                          )),
                          sizedWidth08,
                          Expanded(
                              child: CommonButton(
                            onPress: onPressConfirm,
                            backgroundColor: ColorUtils.restingColor,
                            title: AppLocalizationUtils.instance().confirm,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
