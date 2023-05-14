import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:upgame/game/actors/playerController.dart';
import 'package:upgame/game/maps/map.dart';
import 'package:upgame/game/utils/rayCastCallBack.dart';

class MainGame extends Forge2DGame with HasTappables{


  late MapLevel map;

  late PlayerController playerController;
  late SpriteSheet diceSprite;



  @override
  FutureOr<void> onLoad() async {
    diceSprite=SpriteSheet(image: await images.load('diceSpriteSheet.png'), srcSize: Vector2(32, 32));
    map =MapLevel();
    await add(map);

    camera.zoom=canvasSize.y/map.mapSize.y;
    
    return super.onLoad();
  }

  rayCast(Vector2 pos){
   final castCallBack=NearestPlatformRayCastCallback();
   world.raycast(castCallBack, pos, pos+Vector2(0, -map.mapSize.y/18));
   if(castCallBack.nearestPoint!=null){
    return false;
   }
   return true;
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    playerController.addDice();
    super.onTapDown(pointerId, info);
  }





  initPlayerController(PlayerController controller){
    playerController=controller;
    add(controller);
  }







}