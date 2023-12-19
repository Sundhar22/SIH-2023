import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/chatsonic/controller/ai_controlller.dart';

import '../../chat_summarizer/chat_summarizer.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: TextField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: "Enter your query",
                      border: InputBorder.none,
                    ),
                    controller: textEditingController,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 39, 136, 1),
                    child: GetX<AiController>(builder: (controller) {
                      return IconButton(
                        onPressed: () {
                          print(textEditingController.text);
                          fetchData(textEditingController.text).then((value) {
                            print(value[0]['summary']);
                            controller.reply.value = value[0]['summary'];
                          });
                          
                          
                          controller.aiChatReply.value =
                              !controller.aiChatReply.value;
                        },
                        icon: Icon(
                          controller.icon.value,
                          color: Colors.white,
                        ),
                      );
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<dynamic>> fetchData(String question) async {
  // print(
  //     'https://mitti-server.onrender.com/summary?chat_history=$chat_hisotry}');

  final response = await dio.get(
      'https://mitti-server.onrender.com/query?question=$question}');

  print(response.statusCode);

  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception('Failed to load album');
  }
}
