import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/border_constant.dart';
import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:boxing_traning/common/enum/martial_art_enum.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/home_screen/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MartialArtItem extends StatelessWidget {
  const MartialArtItem({
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
        padding: padH16V12,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorUtils.primaryNew.withOpacity(0.8),
          // gradient: linearGradientCommon,
          borderRadius: BorderConstant.borderRadiusAll08,
        ),
        child: Text(
          martialArtModel.name ?? '',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
