import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:spell_out/splash/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(' ---- splash inicio 1');
    var controller = Get.put(SplashScreenController(context: context));
    print(' ---- splash inicio 2');
    return Scaffold(
      body: Center(
        child: Text('splashSreen'),
      ),
    );
  }
}
