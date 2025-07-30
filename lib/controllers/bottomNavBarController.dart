import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookio/views/homePage.dart';

class BottomNavController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomePage(),
    Container(color: Colors.brown),
    Container(color: Colors.green),
    Container(color: Colors.orange),
  ];
}