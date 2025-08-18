import 'package:bookio/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomNavBar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Obx(() => bottomNavC.screens[bottomNavC.selectedIndex.value]),
    );
  }
}
