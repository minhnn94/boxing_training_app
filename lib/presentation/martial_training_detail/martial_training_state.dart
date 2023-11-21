part of 'martial_training_cubit.dart';

abstract class MartialTrainingState {}

class MartialTrainingInitial extends MartialTrainingState {}

class MartialLoading extends MartialTrainingState {}

class MartialError extends MartialTrainingState {}

class MartialLoadSuccess extends MartialTrainingState {
  final MartialTemplate martialTemplate;

  MartialLoadSuccess(this.martialTemplate);
}
