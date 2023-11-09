import 'dart:ui';

import 'package:boxing_traning/common/enum/martial_art_enum.dart';

class MartialArtModel {
  final MartialArtEnum martialArtEnum;
  final String id;
  final Color? color;

  MartialArtModel({
    required this.martialArtEnum,
    required this.id,
    this.color,
  });
}
