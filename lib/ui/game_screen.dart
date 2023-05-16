import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgame/ui/widgets/live_score.dart';

import '../controllers/game_controller.dart';


class GameScreen extends GetView<GameController> {
const GameScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        GameWidget(game: controller.game),
        Align(
          alignment: Alignment.topLeft+const Alignment(0.1, 0.3),
          child: const LiveScore(),
        )
      ],
    );
  }
}