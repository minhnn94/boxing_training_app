import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/enum/martial_art_enum.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'home_cubit.dart';

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
      appBar: AppBar(
        backgroundColor: ColorUtils.primary,
        title: const Text('Choice Your Skill'),
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
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: data.length,
                      itemBuilder: (BuildContext ctx, index) {
                        final martialArtModel = data[index];
                        return _MartialArtItem(
                          martialArtModel: martialArtModel,
                        );
                      }),
                );
              },
            ),
            CommonButton(
              title: AppLocalizationUtils.instance().createNewSport,
              onPress: _handleOnPressCreateNewSport,
            )
          ],
        ),
      ),
    );
  }
}

class _MartialArtItem extends StatelessWidget {
  const _MartialArtItem({
    super.key,
    required this.martialArtModel,
  });

  final MartialTemplate martialArtModel;

  String getNameDisplay(MartialArtEnum martialArtEnum) {
    if (martialArtEnum != MartialArtEnum.createLesson) {
      return martialArtEnum.name;
    } else {
      return '+ ${martialArtEnum.name}';
    }
  }

  void _handleOnPressItem(BuildContext context) {
    // context.pushNamed(RouterPath.timingScreen, extra: martialArtModel);
    context
        .pushNamed(RouterPath.martialDetail, extra: martialArtModel)
        .then((value) => context.read<HomeCubit>().getAllSport());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleOnPressItem(context),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorUtils.primary, borderRadius: BorderRadius.circular(15)),
        child: Text(
          martialArtModel.name ?? '',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
