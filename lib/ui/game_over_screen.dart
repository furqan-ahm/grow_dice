import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgame/controllers/game_controller.dart';
import 'package:upgame/ui/menu_screen.dart';
import 'package:upgame/ui/widgets/img_button.dart';
import 'package:upgame/ui/widgets/sound_button.dart';

class GameOverScreen extends GetView<GameController> {
  const GameOverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/bg2.png',
              ),
              repeat: ImageRepeat.repeat)),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg3.png',
                ),
                fit: BoxFit.fitHeight,
                alignment: Alignment.center)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'SCORE:',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 34,
                    shadows: [
                      Shadow(
                          color: Color(0xffFCFB08),
                          offset: Offset(0, 1),
                          blurRadius: 4)
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
               () {
                  return Text(
                    '${controller.liveScore}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                    ),
                  );
                }
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                alignment: Alignment.center,
                width: 190,
                child: ImgButton(
                    image: 'assets/images/buttons/menu_btn.png',
                    pressedImage: 'assets/images/buttons/menu-1_btn.png',
                    onPressed: () {Get.offAll(const MenuScreen());}),
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                alignment: Alignment.center,
                width: 190,
                child: ImgButton(
                    image: 'assets/images/buttons/restart_btn.png',
                    pressedImage: 'assets/images/buttons/restart-1_btn.png',
                    onPressed: () {Get.back();controller.startGame();}),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
