import 'dart:ui';

import 'package:boxing_traning/common/enum/martial_art_enum.dart';
import 'package:equatable/equatable.dart';

import 'prepare_model.dart';
import 'resting_model.dart';
import 'training_model.dart';

class MartialArtModel extends Equatable {
  final MartialArtEnum martialArtEnum;
  final String id;
  final Color? color;
  final PrepareModel prepareModel;
  final RestingModel restingModel;
  final TrainingModel trainingModel;

  const MartialArtModel({
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
