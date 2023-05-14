import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:upgame/game/actors/playerController.dart';
import 'package:upgame/game/mainGame.dart';

import '../actors/platform.dart';
import '../actors/playerDice.dart';

class MapLevel extends Component with HasGameRef<MainGame>{


  late Vector2 mapSize;

  @override
  FutureOr<void> onLoad() async{
    TiledComponent map=await TiledComponent.load('map1.tmx', Vector2.all(32)/10, priority: 20);
    add(map);
    mapSize=map.scaledSize;


    
    final spawnLayer=map.tileMap.getLayer<ObjectGroup>('spawn');

    final platformLayer=map.tileMap.getLayer<ObjectGroup>('platforms');


    for(final platform in platformLayer!.objects){
      game.add(Platform(position: Vector2(platform.x/10, platform.y/10), size: Vector2(platform.width/10, platform.height/10),));
    }


    for(final spawn in spawnLayer!.objects){
      if(spawn.class_=='player'){
        game.initPlayerController(PlayerController(initialPos: Vector2(spawn.x/10,spawn.y/10), size: Vector2(spawn.width/10, spawn.height/10)));
      }
    }


    return super.onLoad();
  }


}