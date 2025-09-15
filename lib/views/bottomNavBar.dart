import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookio/controllers/bottomNavBarController.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavC = Get.put(BottomNavController());

    return Obx(
          () => NavigationBar(
        selectedIndex: bottomNavC.selectedIndex.value,
        onDestinationSelected: (index) => bottomNavC.selectedIndex.value = index,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Icons.book), label: 'My Library'),
          NavigationDestination(icon: Icon(Icons.request_page), label: 'Requests'),
          NavigationDestination(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        backgroundColor: Color(0xfff4d75e),
        indicatorColor: Color(0xffd4b200),
      ),
    );
  }
}
