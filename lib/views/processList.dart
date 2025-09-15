import 'package:bookio/views/processPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';

class ProcessesPage extends StatelessWidget {
  const ProcessesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = AuthController.to.user!.uid;

    return Scaffold(
      appBar: AppBar(title: Text("My Processes"), backgroundColor: Color(0xfff4d75e)),
      body: StreamBuilder(
        stream: FirebaseDatabase.instance.ref("exchange_processes")
            .orderByChild("createdAt")
            .onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return Center(child: Text("No processes yet"));
          }

          final data = Map<String, dynamic>.from(snapshot.data!.snapshot.value as Map);
          final processes = data.values.where((process) =>
          process["fromUserId"] == userId || process["toUserId"] == userId
          ).toList();

          processes.sort((a, b) => b["createdAt"].compareTo(a["createdAt"]));

          return ListView.builder(
            itemCount: processes.length,
            itemBuilder: (context, index) {
              final p = processes[index];
              return ListTile(
                title: Text("Process with ${p["toUserId"] == userId ? p["fromUserId"] : p["toUserId"]}"),
                subtitle: Text("Status: ${p["status"]}"),
                onTap: () {
                  Get.to(() => ProcessPage(process: p));
                },
              );
            },
          );
        },
      ),
    );
  }
}
