import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/databasecontroller.dart';
import '../models/book_model.dart';

class DescriptionPage extends StatelessWidget{
  final MyBook book;
  DescriptionPage({super.key, required this.book});
  
  final Database = DatabaseController.to;

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                textAlign: TextAlign.left
            ),
            SizedBox(height: 12),
            Text(
              'Genre: ${book.genre}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.left
            ),
            SizedBox(height: 12),
            Text(
              'Location: ${book.location}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.left
            ),
            SizedBox(height: 12),
            /*Text(
              'Owner: ${Database.userRef.child(book.ownerID).child('username')}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),*/
            ElevatedButton(
              onPressed: () async {
                final processId = FirebaseDatabase.instance.ref().child('exchange_processes').push().key;
                await FirebaseDatabase.instance.ref('exchange_processes/$processId').set({
                  "id": processId,
                  "fromUserId": AuthController.to.user!.uid,
                  "toUserId": book.ownerID,
                  "requestedBookId": book.id,
                  "offeredBookId": null,
                  "status": "pending",
                  "steps": {
                    "requested": true,
                    "accepted": false,
                    "deliveryPicked": false,
                    "deliveryDelivered": false,
                    "returnPicked": false,
                    "returnDelivered": false
                  },
                  "createdAt": ServerValue.timestamp
                });
                Get.snackbar("Request Sent", "Your request has been sent to ${book.ownerID}");
              },
              child: Text("Request Book"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffd4b200),
              ),
            ),
            SizedBox(height: 16),
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