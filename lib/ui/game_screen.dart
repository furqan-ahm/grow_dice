import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../controllers/game_controller.dart';


class GameScreen extends StatelessWidget {
const GameScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return RotatedBox(
      quarterTurns: 0,
      child: GameWidget(game: GameController.game));
  }
}