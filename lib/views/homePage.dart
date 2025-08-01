import 'package:flutter/material.dart';

import '../widgets/productCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4ebc3),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.60,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }
}