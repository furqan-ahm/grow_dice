import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:upgame/game/mainGame.dart';

class GameController extends GetxController{


  Game game=MainGame();

  RxBool sound=true.obs;

  startGame(){
    
  }


}