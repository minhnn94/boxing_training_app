import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/constant/border_constant.dart';
import 'package:flutter/material.dart';

class InputMartialArtName extends StatefulWidget {
  const InputMartialArtName({super.key, this.onChanged, this.name = ''});
  final Function(String)? onChanged;
  final String name;

  @override
  State<InputMartialArtName> createState() => _InputMartialArtNameState();
}

class _InputMartialArtNameState extends State<InputMartialArtName> {
  late final TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    controller.text = widget.name;
  }

  @override
  void dispose() {
    controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localLanguage = AppLocalizationUtils.instance();
    return TextField(
      controller: controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        focusedBorder: borderCommon,
        border: borderCommon,
        disabledBorder: borderCommon,
        hintText: localLanguage.enterNameOfTheSport,
      ),
    );
  }

  final borderCommon = const OutlineInputBorder(
    borderSide: BorderSide(color: ColorUtils.primary, width: 2.0),
    borderRadius: BorderConstant.borderRadiusAll08,
  );
}
