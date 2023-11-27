import 'package:boxing_traning/common/constant/gradient.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PrepareTimeWidget extends StatefulWidget {
  const PrepareTimeWidget(
      {super.key, required this.prepareTime, this.onPrepareDone});
  final int prepareTime;
  final Function? onPrepareDone;
  @override
  State<PrepareTimeWidget> createState() => _PrepareTimeWidgetState();
}

class _PrepareTimeWidgetState extends State<PrepareTimeWidget>
    with TickerProviderStateMixin {
  late final AnimationController linearAnimationController;
  late final CurvedAnimation linearAnimation;
  double animationValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initAnimationController();
  }

  void _initAnimationController() {
    linearAnimationController = AnimationController(
        duration: Duration(seconds: widget.prepareTime), vsync: this);

    linearAnimation =
        CurvedAnimation(parent: linearAnimationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {
              animationValue = linearAnimation.value * 360;
            });
          });
    linearAnimationController
        .forward()
        .then((value) => widget.onPrepareDone?.call());
    // linearAnimationController.();
  }

  @override
  void dispose() {
    linearAnimationController.dispose();
    linearAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        interval: 1,
        maximum: 360,
        showLabels: false,
        showTicks: false,
        startAngle: 270,
        endAngle: 270,
        radiusFactor: 0.6,
        axisLineStyle: AxisLineStyle(
          thickness: 15,
          gradient: sweepGradientCommon,
          thicknessUnit: GaugeSizeUnit.factor,
        ),
        pointers: <GaugePointer>[
          RangePointer(
            gradient: sweepGradientCommon,
            value: animationValue,
            width: 0.2,
            sizeUnit: GaugeSizeUnit.factor,
          )
        ],
      ),
    ]);
  }
}
