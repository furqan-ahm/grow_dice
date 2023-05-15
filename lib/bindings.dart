import 'package:get/get.dart';
import 'package:upgame/controllers/game_controller.dart';

class GameBindings extends Bindings{


  @override
  void dependencies() {
    Get.put(GameController());
  }

}