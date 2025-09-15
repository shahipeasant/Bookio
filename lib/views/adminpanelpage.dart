import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AdminPanelPage extends StatelessWidget {
  AdminPanelPage({super.key});
  final AuthController auth = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Admin Panel", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: (){
                auth.signOut();
              },
              color: Colors.white,
              icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseDatabase.instance.ref("exchange_processes").onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return Center(child: Text("No active exchanges"));
          }

          final data = Map<String, dynamic>.from(snapshot.data!.snapshot.value as Map);

          return ListView(
            children: data.values.map((process) {
              final proc = Map<String, dynamic>.from(process);

              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text("Process ${proc["id"]}"),
                  subtitle: Text("Status: ${proc["status"]}"),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      FirebaseDatabase.instance
                          .ref("exchange_processes/${proc["id"]}")
                          .update({
                        "status": value,
                        "steps/$value": true,
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(value: "accepted", child: Text("Mark Accepted")),
                      PopupMenuItem(value: "deliveryPicked", child: Text("Mark Delivery Picked")),
                      PopupMenuItem(value: "delivered", child: Text("Mark Delivered")),
                      PopupMenuItem(value: "returnPicked", child: Text("Mark Return Picked")),
                      PopupMenuItem(value: "completed", child: Text("Mark Completed")),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
