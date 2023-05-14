import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:upgame/game/actors/platform.dart';

class NearestPlatformRayCastCallback extends RayCastCallback {
  Platform? platform;
  Vector2? nearestPoint;
  Vector2? normalAtInter;

  @override
  double reportFixture(
    Fixture fixture,
    Vector2 point,
    Vector2 normal,
    double fraction,
  ) {
    nearestPoint = point.clone();
    normalAtInter = normal.clone();
    platform = fixture.userData as Platform?;

    // Returning fraction implies that we care only about
    // fixtures that are closer to ray start point than
    // the current fixture
    return fraction;
  }
}