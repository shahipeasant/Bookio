import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/databasecontroller.dart';
import '../models/book_model.dart';

class UserLibraryPage extends StatelessWidget {
  final String userId;
  final String processId;

  const UserLibraryPage({super.key, required this.userId, required this.processId});

  @override
  Widget build(BuildContext context) {
    final db = DatabaseController.to;
    particularBooksList.bindStream(db.userBooks(userId));

    return Scaffold(
      appBar: AppBar(title: Text("Select a Book"), backgroundColor: Color(0xfff4d75e)),
      body: Obx(() {
        if (particularBooksList.isEmpty) return Center(child: Text("No books"));
        return ListView.builder(
          itemCount: particularBooksList.length,
          itemBuilder: (context, index) {
            final book = particularBooksList[index];
            return ListTile(
              title: Text(book.name),
              subtitle: Text(book.author),
              onTap: () {
                FirebaseDatabase.instance
                    .ref("exchange_processes/$processId")
                    .update({"offeredBookId": book.id});
                Get.back();
                Get.snackbar("Book Selected", "You chose ${book.name}");
              },
            );
          },
        );
      }),
    );
  }
}
