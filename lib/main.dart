import 'package:bookio/views/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/bottomNavBarController.dart';
void main() {
  runApp(MyApp());
}

final bottomNavC = Get.put(BottomNavController());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Obx(
              () => bottomNavC.screens[bottomNavC.selectedIndex.value],
        ),
      ),
    );
  }
}