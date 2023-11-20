import 'dart:ui';

class TrainingModel {
  int totalRounds;
  int trainingTime;
  String? soundPath;
  Color? color;
  int reminderFinishTime;
  String? reminderFinishSoundPath;
  int reminderTime;
  String? reminderSoundPath;

  TrainingModel({
    required this.totalRounds,
    required this.trainingTime,
    this.soundPath,
    this.color,
    required this.reminderFinishTime,
    this.reminderFinishSoundPath,
    required this.reminderTime,
    this.reminderSoundPath,
  });
}
