import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/appbar_common.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'home_cubit.dart';
import 'widgets/martial_art_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _handleOnPressCreateNewSport() {
    context
        .pushNamed(RouterPath.setupScreen,
            extra: SetupScreenParams(
              setupType: SetupScreenType.create,
            ))
        .then((value) {
      context.read<HomeCubit>().getAllSport();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: ColorUtils.backgroundColor,
      appBar: AppBarCommon(
        canBack: false,
        title: AppLocalizationUtils.instance().choiceYourSport,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocSelector<HomeCubit, HomeState, List<MartialTemplate>?>(
              selector: (state) {
                return state.data;
              },
              builder: (context, state) {
                final data = state ?? [];
                return Expanded(
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final martialArtModel = data[index];
                      return MartialArtItem(
                        martialArtModel: martialArtModel,
                      );
                    },
                    separatorBuilder: (_, __) {
                      return sizedHeight08;
                    },
                  ),
                );
              },
            ),
            CommonButton(
              title: AppLocalizationUtils.instance().createNewSport,
              onPress: _handleOnPressCreateNewSport,
            ),
            sizedHeight16,
          ],
        ),
      ),
    );
  }
}
