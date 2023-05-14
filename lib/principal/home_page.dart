import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:spell_out/principal/home_page_controller.dart';

class HomePage extends StatelessWidget {
  var controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.randomWord();
          print('holaaaaa');
        },
        child: Icon(Icons.replay_outlined),
      ),
      appBar: AppBar(
        title: const Text('prueba App Bar'),
      ),
      body: Center(
        child: Obx(() => Text(controller.principalWord.value)),
      ),
    );
  }
}
