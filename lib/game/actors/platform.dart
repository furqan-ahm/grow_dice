
import 'package:flame_forge2d/flame_forge2d.dart';

import 'playerDice.dart';

class Platform extends BodyComponent with ContactCallbacks{


  Platform({
    required this.position,
    required this.size,
  });


  
  Vector2 position;
  Vector2 size;


  @override
  // TODO: implement renderBody
  bool get renderBody => false;

  @override
  Body createBody() {
    Shape shape=PolygonShape()..setAsBoxXY(size.x/2, size.y/2);
    BodyDef bodyDef= BodyDef(position: position+Vector2(size.x/2, size.y/2), type: BodyType.static, userData: this);
    FixtureDef fixtureDef = FixtureDef(shape, friction: 0, density: 1, restitution: 0);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

}