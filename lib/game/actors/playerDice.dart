import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/particles.dart' as flame;
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:upgame/game/actors/platform.dart';

import '../mainGame.dart';

class PlayerDie extends BodyComponent<MainGame> with ContactCallbacks {
  PlayerDie({
    required this.position,
    required this.size,
    this.isMainBody=false
  });



  int index=0;

  Vector2 position;
  Vector2 size;

  @override
  bool get renderBody => false;

  bool moveLeft = false;
  bool moveRight = false;

  bool get grounded => inContact.isNotEmpty;



  bool isMainBody;
  
  late double initialPosY;

  
  late SpriteComponent sprite;
  
  List<Object> inContact = [];



  bool removedFromList = false;


  @override
  void beginContact(Object other, Contact contact) {
    if (other is Platform) {
      final playerBottom = body.position.y + size.y / 2;
      final platformTop = other.body.position.y - other.size.y / 2;

      final contactNormal = contact.manifold.localNormal;
      if (contactNormal.y >= -1 && playerBottom <= platformTop) {
        inContact.add(other);
      } else {}
    }
  }

  @override
  void endContact(Object other, Contact contact) {
    if (other is Platform) {
      inContact.remove(other);
    }
    super.endContact(other, contact);
  }

  @override
  Future<void> onLoad() async {
    index= game.playerController.dice.indexOf(this);
    initialPosY = position.y;
     
    sprite = SpriteComponent()
      ..size = size
      ..sprite = game.diceSprite.getSprite(0, index.clamp(0, 5))
      ..anchor = Anchor.center;
    add(sprite);

    await super.onLoad();
    body.linearVelocity=Vector2(5, 0);
  }


  
  @override
  void update(double dt) {
    

    if(!removedFromList){
      final tempIndex= game.playerController.dice.indexOf(this);
      if(index!=tempIndex){
        index=tempIndex;
        sprite.sprite=game.diceSprite.getSprite(0, index.clamp(0, 5));
      }
    }

    if(isMainBody&&!removedFromList){
      game.camera.followVector2(Vector2(body.position.x, game.map.mapSize.y/2));
    }


    if(body.linearVelocity.x==0||body.position.y>game.map.mapSize.y){
      isMainBody=false;
      game.playerController.dice.remove(this);
    }

    super.update(dt);
  }


  @override
  Body createBody() {
    Shape shape = PolygonShape()..setAsBoxXY(size.x / 2, size.y / 2);
    BodyDef bodyDef = BodyDef(
        position: position + Vector2(size.x / 2, 0),
        type: BodyType.dynamic,
        userData: this)
      ..fixedRotation = true;
    FixtureDef fixtureDef = FixtureDef(
      shape,
      friction: 0,
      density: 1,
      restitution: 0,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}