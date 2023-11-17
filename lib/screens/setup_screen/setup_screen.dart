import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/screens/setup_screen/widgets/setting_button.dart';
import 'package:boxing_traning/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localLanguage = AppLocalizationUtils.instance();
    return BaseScaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: AppBar(
            backgroundColor: ColorUtils.trainingColor,
            leading: InkWell(
              onTap: context.pop,
              child: const Icon(Icons.arrow_back_rounded),
            ),
            title: const Text('Timing Screen'),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  // context.pushNamed(RouterPath.setupScreen);
                },
              )
            ],
          )),
      body: Container(
        color: ColorUtils.lightPrimary,
        child: Padding(
          padding: PAD_H16,
          child: Column(
            children: [
              SIZED_H32,
              SettingButton(
                title: localLanguage.breakTime,
              )
            ],
          ),
        ),
      ),
    );
  }
}
