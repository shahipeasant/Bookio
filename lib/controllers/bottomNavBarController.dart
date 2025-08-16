import 'package:bookio/views/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookio/views/homePage.dart';

class BottomNavController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomePage(),
    Wishlist(),
    Container(color: Colors.brown),
    Container(color: Colors.orange),
  ];
}