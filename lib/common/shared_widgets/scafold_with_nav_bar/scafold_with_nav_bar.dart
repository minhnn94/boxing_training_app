import 'package:boxing_traning/common/color_utils.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.navigationShell, {super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        selectedItemColor: ColorUtils.orange,
        unselectedItemColor: ColorUtils.grey200,
        backgroundColor: ColorUtils.primaryNew,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 40,
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history_outlined,
              size: 40,
            ),
            label: '',
          ),
        ],
        onTap: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
