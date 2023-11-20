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
        appBar: appBar,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              // AppKeyboardUtils.unFocusTextField();
            },
            child: body,
          ),
        ),
      ),
    );
  }
}
