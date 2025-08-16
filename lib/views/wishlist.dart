import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/book_model.dart';
import '../widgets/productCard.dart';
import 'description_page.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4ebc3),
      body: Obx(
            () => wishListBooks.isNotEmpty ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.60,
          ),
          itemBuilder: (context, index) {
            return
              GestureDetector(
                  child: ProductCard(book: wishListBooks[index]),
                  onTap: () {
                    Get.to(() => DescriptionPage(book: wishListBooks[index]));
                  }
              );
          },
          itemCount: wishListBooks.length,
        ) :
                Center(child: Text('No books in wishlist')),
      ),
    );
  }
}
