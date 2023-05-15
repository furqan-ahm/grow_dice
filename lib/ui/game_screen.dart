import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/game_controller.dart';


class GameScreen extends GetView<GameController> {
const GameScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return RotatedBox(
      quarterTurns: 0,
      child: GameWidget(game: controller.game));
  }
}