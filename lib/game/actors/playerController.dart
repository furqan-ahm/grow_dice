import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:upgame/game/actors/playerDice.dart';
import 'package:upgame/game/mainGame.dart';

class PlayerController extends Component with HasGameRef<MainGame> {


  PlayerController({required this.initialPos, required this.size});

  Vector2 initialPos;
  Vector2 size;


  List<PlayerDie> dice=[];

  @override
  FutureOr<void> onLoad() {
    
    
    final die = PlayerDie(position: initialPos, size: size, isMainBody: true);
    dice.insert(0,die);
    game.add(die);
    return super.onLoad();
  }



  addDice()async{

    final bool canAdd=game.rayCast(dice.first.body.position);

    if(!canAdd)return;


    game.controller.playDuplicateSFX();
    dice.first.isMainBody=false;
    final die = PlayerDie(position: Vector2(dice.first.body.position.x-size.x/2, dice.first.body.position.y-size.y), size: size, isMainBody: true, initialSpeed: dice.first.body.linearVelocity.x);
    dice.insert(0,die);
    game.add(die);
  }



  @override
  void update(double dt) {

    game.controller.liveScore.value=(dice[0].body.position.x-initialPos.x)~/20;    
    
    super.update(dt);
  }





}