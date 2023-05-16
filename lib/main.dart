import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:upgame/bindings.dart';
import 'package:upgame/ui/menu_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grow Dice',
      initialBinding: GameBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Digital'
      ),
      home: const MenuScreen(),
    );
  }
}
