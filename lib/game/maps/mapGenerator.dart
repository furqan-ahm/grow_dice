import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:upgame/game/actors/playerController.dart';
import 'package:upgame/game/mainGame.dart';
import 'package:upgame/game/maps/mapSlice.dart';

import '../actors/platform.dart';
import '../actors/playerDice.dart';

class MapGenerator extends Component with HasGameRef<MainGame> {
  late Vector2 mapSize;

  Random rand = Random();

  List mapSlices = [];
  double nextPosition = 0;

  @override
  FutureOr<void> onLoad() async {
    final initial = rand.nextInt(4) + 1;

    TiledComponent map = await TiledComponent.load(
      'map${initial}.tmx',
      Vector2.all(32) / 10,
      priority: 20,
    );

    mapSize = map.scaledSize;

    final slice = MapSlice(xPos: 0, map: map, spawnPlayer: true);
    mapSlices.add(slice);
    add(slice);

    return super.onLoad();
  }

  generateMap() async {
    if (mapSlices.length < 4) {
      final initial = rand.nextInt(4) + 1;



      print(initial);
      TiledComponent map = await TiledComponent.load(
        'map${initial}.tmx',
        Vector2.all(32) / 10,
        priority: 20,
      );

      nextPosition += map.scaledSize.x;
      final slice = MapSlice(xPos: nextPosition, map: map,);
      mapSlices.add(slice);
      add(slice);
    }
  }

  @override
  void update(double dt) {
    generateMap();
    super.update(dt);
  }
}
