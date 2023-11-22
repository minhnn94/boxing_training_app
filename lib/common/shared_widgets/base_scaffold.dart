import 'package:boxing_traning/common/color_utils.dart';
import 'package:flutter/material.dart';
// import 'package:sales_support/utils/keyboard_utils/keyboard_utils.dart';

typedef OnPressRightAction = Function();
typedef WillPopCallback = Future<bool> Function();

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    Key? key,
    required this.body,
    this.rightAction,
    this.leading,
    this.leadingWidth,
    this.isIgnoreRightAction = false,
    this.onWillPop,
    this.resizeToAvoidBottomInset,
    this.appBar,
  }) : super(key: key);
  final bool isIgnoreRightAction;
  final Widget body;
  final Widget? rightAction;
  final Widget? leading;
  final double? leadingWidth;
  final WillPopCallback? onWillPop;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onWillPop != null) {
          return onWillPop!();
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        // appBar: appBar,
        backgroundColor: ColorUtils.backgroundColor,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              // AppKeyboardUtils.unFocusTextField();
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                    fit: BoxFit.cover),
              ),
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage('assets/images/vietnam_topteam.jpeg'),
              //       fit: BoxFit.contain),
              // )
              child: Column(
                children: [
                  appBar ?? const SizedBox.shrink(),
                  Expanded(child: body),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
