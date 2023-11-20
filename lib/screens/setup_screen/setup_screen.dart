import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/border_constant.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:boxing_traning/global/app_global_bloc/app_global_cubit.dart';
import 'package:boxing_traning/models/martial_template.dart';
import 'package:boxing_traning/screens/setup_screen/setup_cubit.dart';
import 'package:boxing_traning/screens/setup_screen/widgets/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:textfield_have_range_button/main.dart';

typedef SetupSelector = BlocSelector<SetupCubit, SetupState, int?>;

enum SetupScreenType { edit, create }

class SetupScreenParams {
  SetupScreenType setupType;
  MartialTemplate martial;

  SetupScreenParams({required this.setupType, required this.martial});
}

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key, required this.setupParams});
  final SetupScreenParams setupParams;
  void _handleOnPressDone(BuildContext context) {
    final martial = context.read<SetupCubit>().getMaritalToRequest();
    context.read<AppGlobalCubit>().updateMartialArt(martial);
    context.pop();
  }

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
            title: const Text('Setup Screen'),
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
              Expanded(
                child: Column(
                  children: [
                    sizedHeight32,
                    SetupSelector(
                      selector: (state) {
                        return state.prepareTime;
                      },
                      builder: (context, state) {
                        return SettingButton(
                          title: localLanguage.prepareTime,
                          time: state ?? 0,
                          onChangeTime: context
                              .read<SetupCubit>()
                              .handleOnPressChangePrepareTime,
                        );
                      },
                    ),
                    sizedHeight32,
                    SetupSelector(
                      selector: (state) {
                        return state.roundTime;
                      },
                      builder: (context, state) {
                        return SettingButton(
                          title: localLanguage.roundTime,
                          time: state ?? 0,
                          onChangeTime: context
                              .read<SetupCubit>()
                              .handleOnPressChangeRoundTime,
                        );
                      },
                    ),
                    sizedHeight32,
                    SetupSelector(
                      selector: (state) {
                        return state.breakTime;
                      },
                      builder: (context, state) {
                        return SettingButton(
                          title: localLanguage.breakTime,
                          time: state ?? 0,
                          onChangeTime: context
                              .read<SetupCubit>()
                              .handleOnPressChangeBreakTime,
                        );
                      },
                    ),
                    sizedHeight32,
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      decoration: const BoxDecoration(
                        color: ColorUtils.primary,
                        borderRadius: BorderConstant.borderRadiusAll08,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              localLanguage.totalRounds,
                              style: TextStyleUtils.text14Weight600
                                  .copyWith(color: ColorUtils.white),
                            ),
                          ),
                          SetupSelector(
                            selector: (state) {
                              return state.totalRounds;
                            },
                            builder: (context, state) {
                              return Expanded(
                                  child: UpAndDownTextField(
                                padding: EdgeInsets.zero,
                                baseValue: "$state",
                                onChanged: (value) => context
                                    .read<SetupCubit>()
                                    .handleOnPressChangeTotalRounds(
                                        value.toInt()),
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CommonButton(
                title: localLanguage.done,
                onPress: () => _handleOnPressDone(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
