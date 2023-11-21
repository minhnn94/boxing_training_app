import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/appbar_common.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/martial_training_detail/martial_training_cubit.dart';
import 'package:boxing_traning/presentation/martial_training_detail/widgets/row_of_detail.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/confirm_dialog.dart';
import 'widgets/row_of_time.dart';

class MartialTrainingDetail extends StatefulWidget {
  const MartialTrainingDetail({super.key, required this.martial});

  final MartialTemplate martial;

  @override
  State<MartialTrainingDetail> createState() => _MartialTrainingDetailState();
}

class _MartialTrainingDetailState extends State<MartialTrainingDetail> {
  Future<void> _handleOnPressDeleteMaterialArt(
      BuildContext context, String id) async {
    _showDialogConfirmDelete();
  }

  MartialTemplate getMartialToRequest() {
    final state = context.read<MartialTrainingCubit>().state;
    bool isLoadingSuccess = state is MartialLoadSuccess;
    if (isLoadingSuccess) {
      return state.martialTemplate;
    } else {
      return widget.martial;
    }
  }

  SetupScreenParams getParamToNavigateEditMartial() {
    return SetupScreenParams(
      setupType: SetupScreenType.edit,
      martial: getMartialToRequest(),
    );
  }

  void _handleOnPressEdit() {
    context
        .pushNamed(RouterPath.setupScreen,
            extra: getParamToNavigateEditMartial())
        .then(_handleEditCallBack);
  }

  void _handleOnPressConfirmDelete() {
    context
        .read<MartialTrainingCubit>()
        .deleteMaterialArt(widget.martial.id)
        .then((value) {
      context.pop();
    });
  }

  void _showDialogConfirmDelete() {
    showDialog(
      context: context,
      builder: (_) => ConfirmDialog(
        martial: widget.martial,
      ),
    );
  }

  void _handleEditCallBack(_) {
    context.read<MartialTrainingCubit>().getMaterialDetail(widget.martial.id);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    context.read<MartialTrainingCubit>().initialData(widget.martial.id);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: 'Martial Training Detail',
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: _handleOnPressEdit,
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () =>
                _handleOnPressDeleteMaterialArt(context, widget.martial.id),
          ),
        ],
      ),
      body: BlocBuilder<MartialTrainingCubit, MartialTrainingState>(
        builder: (context, state) {
          if (state is MartialLoadSuccess) {
            final sport = state.martialTemplate;
            final prepareTime = sport.prepareTime ?? 0;
            final breakTime = sport.breakTime ?? 0;
            final roundTime = sport.roundTime ?? 0;
            final totalRounds = sport.totalRounds ?? 0;
            final sportName = sport.name ?? '';
            final localLanguage = AppLocalizationUtils.instance();
            return Padding(
              padding: PAD_H16,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        sizedHeight32,
                        RowOfDetail(
                          title: localLanguage.sportName,
                          content: sportName,
                        ),
                        sizedHeight16,
                        RowOfTime(
                          title: localLanguage.prepareTime,
                          totalSeconds: prepareTime,
                        ),
                        sizedHeight16,
                        RowOfTime(
                          title: localLanguage.roundTime,
                          totalSeconds: roundTime,
                        ),
                        sizedHeight16,
                        RowOfTime(
                          title: localLanguage.breakTime,
                          totalSeconds: breakTime,
                        ),
                        sizedHeight16,
                        RowOfDetail(
                            title: localLanguage.totalRounds,
                            content: '$totalRounds'),
                        sizedHeight16,
                      ],
                    ),
                  ),
                  CommonButton(
                    title: localLanguage.roundTime,
                    onPress: () {
                      context.pushNamed(RouterPath.timingScreen,
                          extra: widget.martial);
                    },
                  )
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
