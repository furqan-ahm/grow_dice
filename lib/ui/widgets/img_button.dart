import 'package:flutter/material.dart';

class ImgButton extends StatefulWidget {
  const ImgButton({ Key? key, required this.image, required this.pressedImage, required this.onPressed }) : super(key: key);


  final String image;
  final String pressedImage;

  final Function() onPressed;

  @override
  _ImgButtonState createState() => _ImgButtonState();
}

class _ImgButtonState extends State<ImgButton> {
  
  bool pressed=false;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
        setState(() {
          pressed=true;
        });
      },
      onTapUp: (_){
        setState(() {
          pressed=false;
        });
        widget.onPressed();
      },
      onTapCancel: (){
        setState(() {
          pressed=false;
        });
      },
      child: Stack(
        children: [
          Image.asset(widget.pressedImage),
          pressed?const SizedBox.shrink():Image.asset(widget.image),
        ],
      ),
    );
  }
}