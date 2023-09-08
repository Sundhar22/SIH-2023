import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/responsehub/chat_layout.dart';

class ResponseHub extends StatelessWidget {
  const ResponseHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          shape: const CircleBorder(),
          elevation: 10,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {}),
      appBar: AppBar(
          elevation: 3, title: const Text("Response Hub"), centerTitle: true),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ResponseHubChatLayout(
                integratedReliefRoomName: "National Disaster Relief Campus",
                integratedReliefRoomCause: "Flood",
                integratedReliefRoomAgencies: [],
                integratedReliefLocation: "Dindugal",
              )
            ],
          ),
        ),
      ),
    );
  }
}
