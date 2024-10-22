import 'package:audioplayers/audioplayers.dart';

class AudioHandler {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static void playAudio(String filePath) {
    _audioPlayer.setSource(DeviceFileSource(filePath));
    _audioPlayer.resume();
  }
}
