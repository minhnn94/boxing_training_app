import 'package:boxing_traning/common/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCommon({
    super.key,
    required this.title,
    this.actions,
  });
  final String title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: ColorUtils.trainingColor,
      leading: InkWell(
        onTap: context.pop,
        child: const Icon(Icons.arrow_back_rounded),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
