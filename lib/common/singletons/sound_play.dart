import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:boxing_traning/common/paths/music_path.dart';

class SoundPlay {
  final assetsAudioPlayer = AssetsAudioPlayer();

  static final SoundPlay _singleton = SoundPlay._internal();

  factory SoundPlay() {
    return _singleton;
  }
  void playSound() {
    assetsAudioPlayer.open(
      Audio(MusicPath.boxingBelt),
    );
  }

  void startBoxingBelt() {
    assetsAudioPlayer.open(
      Audio(MusicPath.boxingBelt),
    );
  }

  SoundPlay._internal();
}
