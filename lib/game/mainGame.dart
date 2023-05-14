import 'dart:async';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:upgame/game/maps/map.dart';

class MainGame extends Forge2DGame{


  @override
  FutureOr<void> onLoad() {
    add(MapLevel());
    return super.onLoad();
  }






}