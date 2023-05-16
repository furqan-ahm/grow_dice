import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgame/game/mainGame.dart';
import 'package:upgame/ui/game_screen.dart';
import 'package:upgame/ui/menu_screen.dart';

import '../ui/game_over_screen.dart';

class GameController extends GetxController {
  Game game = MainGame();

  @override
  void onInit() {
    
    SharedPreferences.getInstance().then((value) async{
      pref = value;
      await FlameAudio.audioCache.loadAll(['lose.mp3', 'duplicate.mp3']);
      
      
      sound.listen((sfx) {
        pref.setBool('sound', sfx);
        if (sfx && !FlameAudio.bgm.isPlaying) {
          FlameAudio.bgm.play('bg.mp3');
        }
        else if(!sfx)FlameAudio.bgm.stop();
      });

      maxScore.listen((score) {
        pref.setInt('score', score);
      });

      liveScore.listen((score) {
        if (score > maxScore.value) {
          maxScore.value = score;
        }
      });


      maxScore.value=pref.getInt('score')??0;
      sound.value=pref.getBool('sound')??true;

    });

    super.onInit();
  }

  RxBool sound = true.obs;

  RxInt maxScore = 0.obs;

  RxInt liveScore = 0.obs;

  late SharedPreferences pref;

  startGame() {
    game = MainGame();
    liveScore.value=0;
    Get.to(const GameScreen());
  }

  playDuplicateSFX() {
    if (sound.value) {
      FlameAudio.play('duplicate.mp3');
    }
  }

  // playBGM(){
  //   if(sound.value&&!FlameAudio.bgm.isPlaying){
  //     FlameAudio.bgm.play('bg.mp3');
  //   }
  // }

  playGameOverSFX() {
    if (sound.value) {
      FlameAudio.play('lose.mp3');
    }
  }

  void gameOver() {
    playGameOverSFX();
    Get.off(const GameOverScreen());
  }
}
