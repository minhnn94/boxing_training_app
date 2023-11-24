import 'package:boxing_traning/common/constant/padding_constant.dart';
import 'package:flutter/material.dart';

class TimingProcessButton extends StatelessWidget {
  const TimingProcessButton(
      {super.key, required this.icon, required this.centerColor, this.onPress});
  final Widget icon;
  final Color centerColor;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 2.0,
      fillColor: centerColor.withOpacity(0.2),
      padding: padAll10,
      shape: const CircleBorder(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: centerColor.withOpacity(0.5), width: 10),
          shape: BoxShape.circle,
        ),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: centerColor,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
      ),
    );
  }
}
