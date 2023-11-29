import 'package:boxing_traning/gen/assets.gen.dart';
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
    this.backgroundColor,
  }) : super(key: key);
  final bool isIgnoreRightAction;
  final Widget body;
  final Widget? rightAction;
  final Widget? leading;
  final double? leadingWidth;
  final WillPopCallback? onWillPop;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onWillPop != null) {
          return onWillPop!();
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body: GestureDetector(
            onTap: () {
              // AppKeyboardUtils.unFocusTextField();
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.ufcBackground.path),
                    // image: NetworkImage(
                    //     "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  appBar ?? const SizedBox.shrink(),
                  Expanded(
                    child: Container(color: backgroundColor, child: body),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
