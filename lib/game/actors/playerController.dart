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
    dice.add(die);
    game.add(die);
    return super.onLoad();
  }



  addDice()async{

    final bool canAdd=game.rayCast(dice.last.body.position);

    if(!canAdd)return;
    dice.last.isMainBody=false;
    final die = PlayerDie(position: Vector2(dice.last.body.position.x-size.x/2, dice.last.body.position.y-size.y), size: size, isMainBody: true);
    dice.add(die);
    add(die);
  }







}