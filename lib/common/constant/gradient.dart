import 'package:boxing_traning/common/color_utils.dart';
import 'package:flutter/cupertino.dart';

const linearGradientCommon = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 1),
  colors: <Color>[
    ColorUtils.primary,
    ColorUtils.primary,
    // Color(0xff1f005c),
    // Color(0xff5b0060),
    // Color(0xff870160),
    // Color(0xffac255e),
    // Color(0xffca485c),
    // Color(0xffe16b5c),
    // Color(0xfff39060),
    // Color(0xffffb56b),
  ], // Gradient from https://learnui.design/tools/gradient-generator.html
  tileMode: TileMode.mirror,
);
const disableGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 1),
  colors: <Color>[
    ColorUtils.grey,
    ColorUtils.grey300
  ], // Gradient from https://learnui.design/tools/gradient-generator.html
);
const sweepGradientCommon = SweepGradient(
  colors: <Color>[
    Color(0xff1f005c),
    Color(0xff5b0060),
    Color(0xff870160),
    Color(0xffac255e),
    Color(0xffca485c),
    Color(0xffe16b5c),
    Color(0xfff39060),
    Color(0xffffb56b),
  ], // Gradient from https://learnui.design/tools/gradient-generator.html
  tileMode: TileMode.mirror,
);
// const trainingGradient = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment(0.8, 1),
//   colors: <Color>[
//     ColorUtils.primary800,
//     ColorUtils.primary700,
//     ColorUtils.primary600,
//     ColorUtils.primary500,
//     ColorUtils.primary400,
//     ColorUtils.primary300,
//     ColorUtils.primary200,
//     ColorUtils.primary100,
//   ], // Gradient from https://learnui.design/tools/gradient-generator.html
//   tileMode: TileMode.mirror,
// );
// const breakGradient = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment(0.8, 1),
//   colors: <Color>[
//     ColorUtils.breakColor800,
//     ColorUtils.breakColor800,
//     ColorUtils.breakColor600,
//     ColorUtils.breakColor500,
//     ColorUtils.breakColor400,
//     ColorUtils.breakColor300,
//     ColorUtils.breakColor200,
//     ColorUtils.breakColor100,
//   ], // Gradient from htrtps://learnui.design/tools/gradient-generator.html
//   tileMode: TileMode.mirror,
// );
final createShader = linearGradientCommon
    .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
final foreGroundCommon = Paint()..shader = createShader;
