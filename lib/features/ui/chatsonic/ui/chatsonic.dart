import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/chatsonic/controller/ai_controlller.dart';
import 'package:sih_2023/features/ui/chatsonic/ui/bottom_field.dart';

class ChatSonic extends StatefulWidget {
  const ChatSonic({super.key});

  @override
  State<ChatSonic> createState() => _ChatSonicState();
}

class _ChatSonicState extends State<ChatSonic> {
  @override
  void initState() {
    super.initState();
    Get.put(AiController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("ChatSonic"),
        centerTitle: true,
      ),
      bottomSheet: const CustomInputField(),
      body: GetX<AiController>(
        builder: (controller) {
          return controller.aiChatReply.value
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        Icons.view_in_ar,
                        size: 50,
                      ),
                    ),
                  ],
                )
              : Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text(
                      "Hello edw de  ew ed e ewwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww  deeeeeeeeeeeew"),
                );
        },
      ),
    );
  }
}
