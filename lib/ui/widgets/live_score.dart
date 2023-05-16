import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgame/controllers/game_controller.dart';

class LiveScore extends GetWidget<GameController> {
  const LiveScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
                  '${controller.liveScore}',
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 54,
                      shadows: [
                        Shadow(
                            color: Color(0xffFCFB08),
                            offset: Offset(0, 1),
                            blurRadius: 4)
                      ]),
                ),
        ),
      ),
    );
  }
}
