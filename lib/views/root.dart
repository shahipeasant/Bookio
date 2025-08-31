import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'login_page.dart';
import 'main_screen.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = AuthController.to;
    return Obx(() {
      if (auth.user == null) {
        return const LoginPage();
      } else {
        return MainScreen();
      }
    });

  }
}