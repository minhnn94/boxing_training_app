import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:boxing_traning/common/paths/music_path.dart';

class SoundPlay {
  final assetsAudioPlayer = AssetsAudioPlayer();

  static final SoundPlay _singleton = SoundPlay._internal();

  factory SoundPlay() {
    return _singleton;
  }
  Future<void> startBoxingBelt() async {
    await assetsAudioPlayer.open(
      Audio(MusicPath.boxingBelt),
    );
  }

  Future<void> playReminderSound() async {
    await assetsAudioPlayer.open(
      Audio(MusicPath.tripleTap),
    );
  }

  Future<void> playFinishSound() async {
    await assetsAudioPlayer.open(
      Audio(MusicPath.finishTime),
    );
  }

  Future<void> startPrepare() async {
    await assetsAudioPlayer.open(
      Audio(MusicPath.startFight),
    );
  }

  // void startBoxingBelt() {
  //   assetsAudioPlayer.open(
  //     Audio(MusicPath.boxingBelt),
  //   );
  // }

  SoundPlay._internal();
}
