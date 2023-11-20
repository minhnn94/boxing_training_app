import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/border_constant.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.backgroundColor,
    this.title = '',
    this.onPress,
    this.child,
  });
  final Color? backgroundColor;
  final String title;
  final Function()? onPress;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorUtils.primary,
          borderRadius: BorderConstant.borderRadiusAll08,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: child ??
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}
