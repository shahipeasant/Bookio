import 'package:bookio/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/productCard.dart';
import 'description_page.dart';

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
          itemBuilder: (context, index) {
            return GestureDetector(
                child: ProductCard(book: booksList[index]),
                onTap: () {
                  Get.to(() => DescriptionPage(book: booksList[index]));
                }
            );
          },
          itemCount: booksList.length,
        ),
    );
  }
}