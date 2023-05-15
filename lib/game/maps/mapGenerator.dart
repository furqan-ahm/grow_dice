import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:upgame/game/mainGame.dart';
import 'package:upgame/game/maps/bgSlice.dart';
import 'package:upgame/game/maps/mapSlice.dart';


class MapGenerator extends Component with HasGameRef<MainGame> {
  late Vector2 mapSize;

  Random rand = Random();

  List<MapSlice> mapSlices = [];
  List<BGSlice> bgSlices= [];


  double nextPosition = 0;


  late Vector2 bgSize;

  @override
  FutureOr<void> onLoad() async {
    final initial = rand.nextInt(4) + 1;

    TiledComponent map = await TiledComponent.load(
      'map$initial.tmx',
      Vector2.all(32) / 10,
      priority: 20,
    );

    mapSize = map.scaledSize;

    final slice = MapSlice(xPos: 0, map: map, spawnPlayer: true);
    mapSlices.add(slice);
    add(slice);

    bgSize=Vector2(map.scaledSize.y*720/1280, map.scaledSize.y);


    final bg=BGSlice(image:await game.images.load('bg.png'), position: Vector2(-bgSize.x, 0), size: bgSize);
    bgSlices.add(bg);
    final bg2=BGSlice(image:await game.images.load('bg.png'), position: Vector2(0, 0), size: bgSize);
    bgSlices.add(bg2);
    game.add(bg);
    game.add(bg2);


    return super.onLoad();
  }


  generateBg()async{
    if(bgSlices.length<8){
      
      final bg=BGSlice(image:await game.images.load('bg.png'), position: Vector2(bgSlices.last.position.x+bgSize.x, 0), size: bgSize);
      bgSlices.add(bg);
      game.add(bg);
    }
  }

  generateMap() async {
    if (mapSlices.length < 4) {
      final initial = rand.nextInt(4) + 1;



      TiledComponent map = await TiledComponent.load(
        'map${initial}.tmx',
        Vector2.all(32) / 10,
        priority: 20,
      );


      nextPosition += mapSlices.last.map.scaledSize.x;
      final slice = MapSlice(xPos: nextPosition, map: map,);
      mapSlices.add(slice);
      add(slice);
    }
  }

  @override
  void update(double dt) {
    generateMap();
    generateBg();
    super.update(dt);
  }
}
