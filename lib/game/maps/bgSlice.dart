import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:upgame/game/mainGame.dart';

class BGSlice extends SpriteComponent with HasGameRef<MainGame>{


  BGSlice({required Image image, required Vector2 size, required Vector2 position}):super.fromImage(image, size: size, position: position, priority: 0);



  @override
  FutureOr<void> onLoad() {
    
    return super.onLoad();
  }


  @override
  void update(double dt) {
    if(position.x+size.x<game.camera.position.x){
      removeFromParent();
      game.map.bgSlices.remove(this);
    }
    super.update(dt);
  }




}