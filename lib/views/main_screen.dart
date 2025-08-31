import 'package:bookio/main.dart';
import 'package:bookio/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomNavBar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final AuthController auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: auth.signOut, icon: Icon(Icons.logout))]),
      bottomNavigationBar: BottomNavBar(),
      body: Obx(() => bottomNavC.screens[bottomNavC.selectedIndex.value]),
    );
  }
}
