import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/extensions/go_router_extension.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishedTimeContent extends StatelessWidget {
  const FinishedTimeContent({super.key});
  Future<void> _handleOnPressBackAndSave(BuildContext context) async {
    await context.read<TimingCubit>().onSaveTraining().then((value) {
      context.popUntilPath(RouterPath.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final localLanguage = AppLocalizationUtils.instance();
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                sizedHeight120,
                Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: ColorUtils.primaryNew,
                      // gradient: trainingGradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        localLanguage.finished,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.white,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          CommonButton(
            title: localLanguage.backToHome,
            onPress: () => _handleOnPressBackAndSave(context),
          ),
          sizedHeight16,
        ],
      ),
    );
  }
}
