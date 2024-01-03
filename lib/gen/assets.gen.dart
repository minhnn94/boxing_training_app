/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/conor.jpeg
  AssetGenImage get conor => const AssetGenImage('assets/images/conor.jpeg');

  /// File path: assets/images/dustin_poirier.jpeg
  AssetGenImage get dustinPoirier =>
      const AssetGenImage('assets/images/dustin_poirier.jpeg');

  /// File path: assets/images/poirier_2.jpeg
  AssetGenImage get poirier2 =>
      const AssetGenImage('assets/images/poirier_2.jpeg');

  /// File path: assets/images/ufc_background.jpeg
  AssetGenImage get ufcBackground =>
      const AssetGenImage('assets/images/ufc_background.jpeg');

  /// File path: assets/images/vietnam_topteam.jpeg
  AssetGenImage get vietnamTopteam =>
      const AssetGenImage('assets/images/vietnam_topteam.jpeg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [conor, dustinPoirier, poirier2, ufcBackground, vietnamTopteam];
}

class $AssetsMp3Gen {
  const $AssetsMp3Gen();

  /// File path: assets/mp3/boxing-bell.mp3
  String get boxingBell => 'assets/mp3/boxing-bell.mp3';

  /// File path: assets/mp3/fight_bell.mp3
  String get fightBell => 'assets/mp3/fight_bell.mp3';

  /// File path: assets/mp3/workout_finished.wav
  String get workoutFinished => 'assets/mp3/workout_finished.wav';

  /// List of all assets
  List<String> get values => [boxingBell, fightBell, workoutFinished];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMp3Gen mp3 = $AssetsMp3Gen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
