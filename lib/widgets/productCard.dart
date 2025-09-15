import 'package:bookio/controllers/databasecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/book_model.dart';

class ProductCard extends StatelessWidget {
  final MyBook book;
  const ProductCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.5),
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xfff4d75e),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: IconButton(
                                icon: wishListBooks.contains(book) ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border),
                                onPressed: (){
                                  if(wishListBooks.contains(book)){
                                    wishListBooks.remove(book);
                                    DatabaseController.to.removeFromWishlist(book.id);
                                  }else{
                                    wishListBooks.add(book);
                                    DatabaseController.to.addToWishlist(book.id);
                                  }
                                }
                            ),
                          ),
                      ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex:2,
              child: Padding(
                padding: EdgeInsets.all(2.5),
                child: ListTile(
                  title:
                  Text(
                    book.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text(
                    book.author,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Chip(
                    padding: EdgeInsets.only(left: 2.5),
                    label: Text(book.genre),
                    backgroundColor: Color(0xfff4d75e),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Chip(
                    padding: EdgeInsets.only(left: 2.5),
                    label: Text(book.location),
                    backgroundColor: Color(0xfff4d75e),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
