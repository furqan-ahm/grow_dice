import 'package:flutter/material.dart';
import 'package:upgame/ui/widgets/img_button.dart';
import 'package:upgame/ui/widgets/sound_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
                'BEST SCORE:',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 34,
                    shadows: const [
                      Shadow(
                          color: Color(0xffFCFB08),
                          offset: Offset(0, 1),
                          blurRadius: 4)
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '24',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ImgButton(
                    image: 'assets/images/buttons/start_btn.png',
                    pressedImage: 'assets/images/buttons/start-1_btn.png',
                    onPressed: () {}),
              ),
              const SizedBox(
                height: 125,
              ),
              const Text(
                'SOUND',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 34,
                    shadows: const [
                      Shadow(
                          color: Color(0xffFCFB08),
                          offset: Offset(0, 1),
                          blurRadius: 4)
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const SoundButton()
            ],
          ),
        ),
      ),
    ));
  }
}
