import 'package:audioplayers/audio_cache.dart';

class AudioPlayer {
  AudioPlayer._();

  static Future playSound(String path) async {
    try {
      AudioCache cache = new AudioCache();
      return await cache.play(path);
    } catch (ex) {}
  }
}
