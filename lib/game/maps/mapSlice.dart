import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:upgame/game/mainGame.dart';

import '../actors/platform.dart';
import '../actors/playerController.dart';

class MapSlice extends Component with HasGameRef<MainGame> {
  MapSlice({required this.xPos, this.spawnPlayer = false, required this.map});

  double xPos;
  bool spawnPlayer;

  TiledComponent map;

  @override
  FutureOr<void> onLoad() {
    map.position = Vector2(xPos, 0);

    game.add(map);

    final platformLayer = map.tileMap.getLayer<ObjectGroup>('platforms');

    for (final platform in platformLayer!.objects) {
      game.add(Platform(
        position: Vector2(platform.x / 10 + xPos, platform.y / 10),
        size: Vector2(platform.width / 10, platform.height / 10),
      ));
    }

    if (spawnPlayer) {
      final spawnLayer = map.tileMap.getLayer<ObjectGroup>('spawn');
      for (final spawn in spawnLayer!.objects) {
        if (spawn.class_ == 'player') {
          game.initPlayerController(PlayerController(
              initialPos: Vector2(spawn.x / 10, spawn.y / 10),
              size: Vector2(spawn.width / 10, spawn.height / 10)));
        }
      }
    }

    return super.onLoad();
  }


  @override
  void update(double dt) {
    if(xPos+map.scaledSize.x<game.camera.position.x){
      removeFromParent();
      game.map.mapSlices.remove(this);
      game.remove(map); 
    }
    super.update(dt);
  }
}
