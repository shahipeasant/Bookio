import 'package:bookio/views/user_library_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class ProcessPage extends StatelessWidget {
  final Map process;
  const ProcessPage({super.key, required this.process});

  @override
  Widget build(BuildContext context) {
    final userId = AuthController.to.user!.uid;
    final steps = process["steps"] as Map;

    final isOwner = process["toUserId"] == userId; // User B
    final isRequester = process["fromUserId"] == userId; // User A

    return Scaffold(
      body: Column(
        children: [
          // Stepper widget
          Expanded(
            child: Stepper(
              currentStep: steps.values.where((v) => v == true).length - 1,
              steps: [
                Step(
                  title: Text("Requested"),
                  content: Text("Request created"),
                ),
                Step(
                  title: Text("Accepted"),
                  content: Text("Waiting for acceptance"),
                ),
                Step(
                  title: Text("Delivery Picked"),
                  content: Text("Deliveryman picked the book"),
                ),
                Step(
                  title: Text("Delivery Delivered"),
                  content: Text("Delivered to user"),
                ),
                Step(
                  title: Text("Return Picked"),
                  content: Text("Book collected back"),
                ),
                Step(
                  title: Text("Return Delivered"),
                  content: Text("Returned to owner"),
                ),
              ],
            ),
          ),

          // Action buttons
          if (isOwner && process["status"] == "pending") // show only to User B
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseDatabase.instance
                        .ref("exchange_processes/${process["id"]}")
                        .update({"status": "cancelled"});
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Cancel Request"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // First mark as accepted
                    FirebaseDatabase.instance
                        .ref("exchange_processes/${process["id"]}")
                        .update({"status": "accepted", "steps/accepted": true});

                    // Then navigate to User A's library
                    Get.to(
                      () => UserLibraryPage(
                        userId: process["fromUserId"],
                        processId: process["id"],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text("Accept & Choose Book"),
                ),
              ],
            ),

          if (isRequester &&
              process["status"] == "pending") // show only to User A
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Waiting for the owner to respond...",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),

          // At bottom of ProcessPage body
          if (isOwner && process["status"] == "accepted")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Waiting for delivery pickup...",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

          if (isRequester && process["status"] == "accepted")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your request was accepted! Delivery is being arranged.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

          if (process["status"] == "completed")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Exchange completed successfully 🎉",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
