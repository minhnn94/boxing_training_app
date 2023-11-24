import 'package:boxing_traning/common/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCommon({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.canBack = true,
  });
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool canBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      backgroundColor: ColorUtils.primaryNew,
      // flexibleSpace: Container(
      //   decoration: BoxDecoration(gradient: linearGradientCommon),
      // ),
      leading: Visibility(
        visible: canBack,
        child: InkWell(
          onTap: context.pop,
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
