import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/appbar_common.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/models/martial_template.dart';
import 'package:boxing_traning/routers/router_name.dart';
import 'package:boxing_traning/screens/setup_screen/setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/row_of_detail.dart';

class MartialTrainingDetail extends StatelessWidget {
  const MartialTrainingDetail({super.key, required this.martial});
  final MartialTemplate martial;
  @override
  Widget build(BuildContext context) {
    final prepareTime = martial.prepareTime ?? 0;
    final breakTime = martial.breakTime ?? 0;
    final roundTime = martial.roundTime ?? 0;
    final totalRounds = martial.totalRounds ?? 0;
    final localLanguage = AppLocalizationUtils.instance();
    return BaseScaffold(
      appBar: AppBarCommon(
        title: 'Martial Training Detail',
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              context.pushNamed(
                RouterPath.setupScreen,
                extra: SetupScreenParams(
                  setupType: SetupScreenType.edit,
                  martial: martial,
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: PAD_H16,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  sizedHeight32,
                  RowOfDetail(
                    title: localLanguage.prepareTime,
                    totalSeconds: prepareTime,
                  ),
                  sizedHeight16,
                  RowOfDetail(
                    title: localLanguage.roundTime,
                    totalSeconds: roundTime,
                  ),
                  sizedHeight16,
                  RowOfDetail(
                    title: localLanguage.breakTime,
                    totalSeconds: breakTime,
                  ),
                  sizedHeight16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localLanguage.totalRounds,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.primary),
                      ),
                      Text(
                        '$totalRounds',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.primary),
                      )
                    ],
                  ),
                  sizedHeight16,
                ],
              ),
            ),
            CommonButton(
              title: localLanguage.roundTime,
              onPress: () {
                context.pushNamed(RouterPath.timingScreen, extra: martial);
              },
            )
          ],
        ),
      ),
    );
  }
}
