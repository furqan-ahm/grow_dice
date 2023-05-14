import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/particles.dart' as flame;
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:upgame/game/actors/platform.dart';

import '../mainGame.dart';

class Player extends BodyComponent<MainGame> with ContactCallbacks {
  Player({
    required this.position,
    required this.size,
  });

  Vector2 position;
  Vector2 size;

  @override
  bool get renderBody => false;

  bool moveLeft = false;
  bool moveRight = false;

  bool get grounded => inContact.isNotEmpty;


  
  late double initialPosY;

  late Image blueParticleImage;

  late Image blackParticleImage;

  List<Object> inContact = [];





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
    initialPosY = position.y;
     
    SpriteComponent sprite = SpriteComponent()
      ..size = size
      ..sprite = await game.loadSprite('dice1.png')
      ..anchor = Anchor.center;
    add(sprite);

    //sync.Timer.periodic(const Duration(milliseconds: 200), (timer) {generateParticle();});

    await super.onLoad();
    //game.camera.followVector2();
  }


  
  @override
  void update(double dt) {
    
    
    if (moveLeft) {
      body.linearVelocity = Vector2(-6, body.linearVelocity.y);
    }

    if (moveRight) {
      body.linearVelocity = Vector2(6, body.linearVelocity.y);
    }
    super.update(dt);
  }

  generateParticle() {
    final particleSys = ParticleSystemComponent(
        priority: -2,
        particle: flame.Particle.generate(
          lifespan: 2,
          count: 4,
          generator: (i) {
            final particleVelocity = Vector2((Random().nextDouble() - 0.5) * 3,
                (Random().nextDouble() - 0.5) * -3);
            final particleSize =
                (Vector2.all(size.x)) / 2 * Random().nextDouble();
            final image = Random().nextInt(10) < 5
                ? blueParticleImage
                : blackParticleImage;
            return flame.AcceleratedParticle(
                lifespan: 2,
                acceleration: particleVelocity,
                child: flame.ImageParticle(
                  image: image,
                  size: particleSize,
                  lifespan: 200,
                ));
          },
        ));
    add(particleSys);
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
      friction: 0.3,
      density: 1,
      restitution: 0,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}