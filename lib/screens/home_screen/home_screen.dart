import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/enum/martial_art_enum.dart';
import 'package:boxing_traning/global/app_global_bloc/app_global_cubit.dart';
import 'package:boxing_traning/models/martial_art_model.dart';
import 'package:boxing_traning/models/prepare_model.dart';
import 'package:boxing_traning/models/resting_model.dart';
import 'package:boxing_traning/models/training_model.dart';
import 'package:boxing_traning/routers/router_name.dart';
import 'package:boxing_traning/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mixMartialArt = MartialArtModel(
    martialArtEnum: MartialArtEnum.mma,
    id: '3',
    prepareModel: PrepareModel(prepareTime: 10),
    restingModel: RestingModel(restingTime: 60, reminderTime: 10),
    trainingModel: TrainingModel(
      roundTotal: 5,
      trainingTime: 60,
      reminderFinishTime: 10,
      reminderTime: 0,
    ),
  );

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
            Text(AppLocalizationUtils.instance().helloWorld('John')),
            Text(AppLocalizationUtils.instance().nWombats(0)),
            InkWell(
              onTap: () {
                context.read<AppGlobalCubit>().addNewMartialArt(mixMartialArt);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorUtils.primary,
                    borderRadius: BorderRadius.circular(15)),
                child: const Text(
                  'Add MMA',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            BlocSelector<AppGlobalCubit, AppGlobalState,
                List<MartialArtModel>?>(
              selector: (state) {
                return state.martialArts;
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

  final MartialArtModel martialArtModel;

  String getNameDisplay(MartialArtEnum martialArtEnum) {
    if (martialArtEnum != MartialArtEnum.createLesson) {
      return martialArtEnum.name;
    } else {
      return '+ ${martialArtEnum.name}';
    }
  }

  void _handleOnPressItem(BuildContext context) {
    context.pushNamed(RouterPath.timingScreen, extra: martialArtModel);
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
          getNameDisplay(martialArtModel.martialArtEnum),
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
