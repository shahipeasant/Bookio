import 'package:bookio/views/book_add_form.dart';
import 'package:bookio/widgets/myBookCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/book_model.dart';
import '../widgets/productCard.dart';
import 'description_page.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4ebc3),
      appBar: AppBar(
        backgroundColor: Color(0xfff4d75e),
        title: Text('My Library'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Get.to(() => BookAddForm());
              },
              icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.60,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                child: Mybookcard(myBook: myBooks[index]),
            );
          },
          itemCount: myBooks.length,
        ),
      ),
    );
  }
}
