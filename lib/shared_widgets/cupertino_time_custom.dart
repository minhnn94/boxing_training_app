import 'package:flutter/cupertino.dart';

const double _kItemExtent = 32.0;

class CupertinoTimeCustom extends StatelessWidget {
  const CupertinoTimeCustom({
    super.key,
    this.onSelectedItemChanged,
    this.initialValue = 0,
  });
  final Function(int)? onSelectedItemChanged;
  final int initialValue;
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: _kItemExtent,
      // This sets the initial item.
      scrollController: FixedExtentScrollController(
        initialItem: 0,
      ),
      // This is called when selected item is changed.
      onSelectedItemChanged: onSelectedItemChanged,
      children: List<Widget>.generate(61, (int index) {
        return Center(child: Text('$index'));
      }),
    );
  }
}
