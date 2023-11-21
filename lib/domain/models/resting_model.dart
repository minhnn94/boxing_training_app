import 'dart:ui';

class RestingModel {
  int restingTime;
  String? reminderSoundPath;
  int reminderTime;
  Color? color;

  RestingModel({
    required this.restingTime,
    this.reminderSoundPath,
    required this.reminderTime,
    this.color,
  });
}
