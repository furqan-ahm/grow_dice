import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgame/controllers/game_controller.dart';

class SoundButton extends GetWidget<GameController> {
const SoundButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: 72,
      child: Obx(
        () {
          return GestureDetector(
            onTap: (){
              controller.sound.value=!controller.sound.value;
            },
            child: Stack(
              children: [
                Image.asset('assets/images/buttons/off_btn.png'),
                controller.sound.value?Image.asset('assets/images/buttons/on_btn.png'):const SizedBox.shrink()
              ],
            ),
          );
        }
      ),
    );
  }
}