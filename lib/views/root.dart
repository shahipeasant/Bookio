import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'adminpanelpage.dart';
import 'authwrapper.dart';
import 'login_page.dart';
import 'main_screen.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController.to;

    return Obx(() {
      print("Root rebuilt: user=${auth.user}");
      if (auth.user == null) {
        return AuthWrapper();
      } else if(auth.user?.email == "admin@admin.admin") {
        return AdminPanelPage();
      } else{
        return MainScreen();
      }
    });
  }
}
