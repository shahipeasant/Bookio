import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/book_model.dart';

class DescriptionPage extends StatelessWidget{
  final Book book;
  const DescriptionPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4ebc3),
      appBar: AppBar(
        backgroundColor: Color(0xfff4d75e),
        title: Text('Description'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              book.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Text(
              book.description,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left
            ),
            SizedBox(height: 12),
            Text(
              'Author: ${book.author}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Genre: ${book.genre}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Location: ${book.location}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffd4b200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}