import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:spell_out/database/database.dart';
import 'package:spell_out/principal/home_page.dart';

class SplashScreenController extends GetxController {
  late BuildContext context;

  SplashScreenController({required this.context});
  DicctionaryDataBase db = DicctionaryDataBase();
  @override
  void onInit() async {
    print('------- on init ------');
    await db.database;
    await Future.delayed(const Duration(seconds: 3));
    Future.delayed(Duration.zero, () {
      _openMyPage(context);
    });
    super.onInit();
  }

  void _openMyPage(BuildContext context) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => HomePage(),
      ),
    );
  }

  @override
  void dispose() {
    print('------- on close ------');
    db.close();
    super.dispose();
  }
}
