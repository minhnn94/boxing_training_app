import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/border_constant.dart';
import 'package:boxing_traning/common/constant/gradient.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.backgroundColor,
    this.title = '',
    this.onPress,
    this.child,
    this.disableBackground,
    this.titleDisableColor,
    this.disable = false,
  });
  final Color? backgroundColor;
  final String title;
  final Function()? onPress;
  final Widget? child;
  final bool disable;
  final Color? disableBackground;
  final Color? titleDisableColor;
  void _handleOnPress() {
    if (disable) {
      return;
    } else {
      onPress?.call();
    }
  }

  Color _getBackgroundColor() {
    if (disable) {
      return disableBackground ?? ColorUtils.grey;
    } else {
      return backgroundColor ?? ColorUtils.orange;
    }
  }

  LinearGradient _getGradient() {
    if (!disable) {
      return linearGradientCommon;
    } else {
      return disableGradient;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleOnPress,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          // gradient: _getGradient(),
          borderRadius: BorderConstant.borderRadiusAll08,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: child ??
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyleUtils.text16Weight600
                  .copyWith(color: ColorUtils.white),
            ),
      ),
    );
  }
}
