import 'dart:ui';

import 'package:boxing_traning/common/enum/martial_art_enum.dart';
import 'package:boxing_traning/models/prepare_model.dart';
import 'package:boxing_traning/models/resting_model.dart';
import 'package:boxing_traning/models/training_model.dart';
import 'package:equatable/equatable.dart';

class MartialArtModel extends Equatable {
  final MartialArtEnum martialArtEnum;
  final String id;
  final Color? color;
  final PrepareModel prepareModel;
  final RestingModel restingModel;
  final TrainingModel trainingModel;

  MartialArtModel({
    required this.martialArtEnum,
    required this.id,
    this.color,
    required this.prepareModel,
    required this.restingModel,
    required this.trainingModel,
  });

  @override
  List<Object?> get props => [
        martialArtEnum,
        id,
        color,
        prepareModel,
        restingModel,
        trainingModel,
      ];
}
