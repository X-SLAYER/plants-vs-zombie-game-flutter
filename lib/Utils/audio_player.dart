import 'package:audioplayers/audio_cache.dart';
import 'package:plants_vs_zombie/Constant/assets.dart';

class AudioPlayer {
  AudioPlayer._();

  static Future playSound() async {
    AudioCache cache = new AudioCache();
    return await cache.play(Assets.shootSoundEffet);
  }
}
