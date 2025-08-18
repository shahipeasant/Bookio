import 'package:bookio/views/bottomNavBar.dart';
import 'package:bookio/views/login_page.dart';
import 'package:bookio/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/bottomNavBarController.dart';
void main() {
  runApp(MyApp());
}

final bottomNavC = Get.put(BottomNavController());
bool isLoggedIn = false;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? MainScreen() : LoginPage(),
    );
  }
}