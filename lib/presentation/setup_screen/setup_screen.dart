import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/border_constant.dart';
import 'package:boxing_traning/common/constant/gradient.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/appbar_common.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_cubit.dart';
import 'package:boxing_traning/presentation/setup_screen/widgets/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:textfield_have_range_button/main.dart';

import 'widgets/input_martial_art_name.dart';

typedef SetupSelector = BlocSelector<SetupCubit, SetupState, int?>;

enum SetupScreenType { edit, create }

class SetupScreenParams {
  SetupScreenType setupType;
  MartialTemplate? martial;

  SetupScreenParams({required this.setupType, this.martial});
}

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key, required this.setupParams});
  final SetupScreenParams setupParams;
  Future<void> _handleOnPressDone(BuildContext context) async {
    context
        .read<SetupCubit>()
        .handleOnPressDone(setupParams.setupType)
        .then((value) {
      context.pop();
    });
  }

  String getTitleAppBar() {
    final setupType = setupParams.setupType;
    if (setupType == SetupScreenType.edit) {
      return AppLocalizationUtils.instance().editSport;
    } else {
      return AppLocalizationUtils.instance().createSport;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localLanguage = AppLocalizationUtils.instance();
    final cubit = context.read<SetupCubit>();
    final martial = setupParams.martial;
    return BaseScaffold(
      appBar: AppBarCommon(
        title: getTitleAppBar(),
      ),
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
                    InputMartialArtName(
                      onChanged: cubit.onChangedName,
                      name: martial?.name ?? '',
                    ),
                    sizedHeight32,
                    SetupSelector(
                      selector: (state) {
                        return state.prepareTime;
                      },
                      builder: (context, state) {
                        return SettingButton(
                          title: localLanguage.prepareTime,
                          time: state ?? 0,
                          onChangeTime: cubit.handleOnPressChangePrepareTime,
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
                          onChangeTime: cubit.handleOnPressChangeRoundTime,
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
                          onChangeTime: cubit.handleOnPressChangeBreakTime,
                        );
                      },
                    ),
                    sizedHeight32,
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      decoration: const BoxDecoration(
                        gradient: linearGradientCommon,
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
                                baseValue: "${state ?? 0}",
                                decoration: const InputDecoration.collapsed(
                                  hintText: '',
                                ),
                                onChanged: (value) =>
                                    cubit.handleOnPressChangeTotalRounds(
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
              BlocSelector<SetupCubit, SetupState, bool>(
                selector: (state) {
                  return state.isEnableConfirm;
                },
                builder: (context, state) {
                  return CommonButton(
                    disable: !state,
                    title: localLanguage.done,
                    onPress: () => _handleOnPressDone(context),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
