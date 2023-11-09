enum MartialArtEnum { boxing, karate, mma, kickboxing, jiujitsu, createLesson }

extension MartialArtEnumExtension on MartialArtEnum {
  String getName() {
    switch (this) {
      case MartialArtEnum.boxing:
        return 'Boxing';
      case MartialArtEnum.karate:
        return 'Karate';
      case MartialArtEnum.mma:
        return 'MMA';
      case MartialArtEnum.kickboxing:
        return 'KickBoxing';
      case MartialArtEnum.jiujitsu:
        return 'Jiujitsu';
      case MartialArtEnum.createLesson:
        return 'Create Lesson';
    }
  }

  String get name => getName();
}
