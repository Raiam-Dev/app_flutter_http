import 'package:just_audio/just_audio.dart';

void audioconfig(int nota) async {
  final player = AudioPlayer();
  try {
    await player.setAsset("music/nota$nota.wav");
    await player.play();
  } catch (erro) {
    print(erro);
  }
}
