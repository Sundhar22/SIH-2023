import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';
import 'package:sih_2023/features/ui/chat/controller/messgae_controller.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sih_2023/features/ui/chat/view/select_media.dart';

class ChatMessenger extends StatefulWidget {
  const ChatMessenger({super.key, required this.roomId});
  final String roomId;

  @override
  State<ChatMessenger> createState() => _ChatMessengerState();
}

class _ChatMessengerState extends State<ChatMessenger> {
  late final TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    Get.put(MessageController());
    messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromRGBO(249, 249, 249, 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GetX<MessageController>(builder: (controller) {
                  return TextField(
                    onTapOutside: (event) =>
                        controller.isTextFieldActivated.value = false,
                    onTap: () => controller.isTextFieldActivated.value = true,
                    controller: messageController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: controller.textFieldSentence.value,
                      border: InputBorder.none,
                    ),
                  );

                }),
              ),
            ),
            GetX<MessageController>(builder: (controller) {
              return Row(
                children: [
                  !controller.isTextFieldActivated.value
                      ? SelectMedia(roomId: widget.roomId)
                      : const SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 39, 136, 1),
                    child: IconButton(
                      onPressed: () {
                        if (messageController.value.text.length > 5) {
                          Message textMessage = Message(
                            type: 'Text',
                            content: messageController.value.text,
                            time: Timestamp.now(),
                            sender: userData,
                          );
                          sendMessageToRoom(widget.roomId, textMessage);
                          messageController.clear();
                          controller.isTextFieldActivated.value = false;
                        } else {
                          controller.isTextFieldActivated.value = false;
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  Future<void> sendMessageToRoom(String roomId, Message message) async {
    try {
      // Reference the room's "chatData" subcollection and add the message
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .collection('chatData')
          .add(message.toMap());
    } catch (error) {
      showToast("Please connect to internt");
    }
  }
}
